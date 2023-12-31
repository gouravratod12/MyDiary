require 'prawn'

class BillsController< ApplicationController

  before_action :set_bill, only: [:edit, :update , :show , :destroy]

  def index
    @bills = Bill.all
    @items = Item.all
    if params[:query].present?
      @bills = Bill.joins(:customer).where("customers.customer_name LIKE ?", "%#{params[:query]}%")
    else
      @bills = Bill.joins(:customer).order('customers.customer_name ASC')
    end
  end

  def new
    @bill  = Bill.new
    @item  = Item.new
    @products = Product.all
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
    @unique_units = Product.distinct.pluck(:unit)
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
    params.require(:bill).permit( :id, :bill_date,:customer_id,:product_id,:id,items_attributes: [:id, :weight, :amount, :bill_id, :product_id, :_destroy])
  end

  def set_bill
    @bill = Bill.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to bills_path, notice: error
  end
end