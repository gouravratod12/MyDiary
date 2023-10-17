class BillManagersController< ApplicationController

  before_action :set_bill_manager, only: [:edit, :update , :show , :destroy]

  def index
    @bill_managers = BillManager.all
  end

  def new
    @bill_manager  = BillManager.new
  end

  def create
    @bill_manager  = BillManager.new(product_params)

    if @bill_manager.save
      redirect_to bill_managers_path, notice: 'Your bill has been created successfully'

    else
      render :new
    end
  end

  def edit

  end

  def update

    if @bill_manager.update(bill_manager_params)
      redirect_to  edit_bill_manager_path, notice: 'Your bill  has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy
    if @bill_manager.destroy
      redirect_to bill_managers_path, notice: 'Your bill has been deleted succesfully'
    end
  end

  private

  def bill_manager_params
    params.require(:bill_manager).permit( :bill_date)
  end

  def set_bill_manager
    @bill_manager = BillManager.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to bill_managers_path, notice: error
  end
end