require 'prawn'

class BillsController< ApplicationController

  before_action :set_bill, only: [:edit, :update , :show , :destroy]

  def index
    @bills = Bill.all
    @items = Item.all
  end

  def new
    @bill  = Bill.new
    @bill.items.build
  end

  def create
    @bill = Bill.new(bill_params)


    if @bill.save
      redirect_to bills_path, notice: 'Your bill has been created successfully'

    else
      render :new
    end
  end

  def edit

  end

  def update

    if @bill.update(bill_params)
      redirect_to  edit_bill_path, notice: 'Your bill  has been updated succesfully'
    else
      render :edit
   end
 end

  def show
    @bill = Bill.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = render_to_string pdf: "#{@bill.id}", template: 'bills/show.html.erb', layout: 'pdf.html.erb'
        send_data pdf, filename: "#{@bill.id}.pdf",type: 'application/pdf' , disposition: 'attachment'
      end
    end
  end

  def destroy
    if @bill.destroy
      redirect_to bills_path, notice: 'Your bill has been deleted succesfully'
    end
  end

  def show_items
    @bill = Bill.find(params[:id])
    @items = @bill.items
   end

  private

  def bill_params
    params.require(:bill).permit( :bill_date,:weight,:amount,:customer_id,:product_id,:id)
  end

  def set_bill
    @bill = Bill.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to bills_path, notice: error
  end
end