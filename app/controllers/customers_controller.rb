class CustomersController < ApplicationController

  before_action :set_customer, only: [:edit, :update , :show , :destroy]
  include Pagy::Backend

  def index
    @pagy, @customers = pagy(Customer.all)
    if params[:query].present?
      @customers = Customer.where("customer_name LIKE ?", "%#{params[:query]}%" )
    else
      @customers = Customer.all.order(:customer_name)
    end

  end

  def new
    @customer  = Customer.new
  end

  def create
    @customer  = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: 'Customer has been created successfully'

    else
      render :new
    end
  end

  def edit

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to edit_customer_path, notice: 'Customer has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy


    if @customer.destroy
      redirect_to customers_path, notice: 'Customer has been deleted succesfully'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :customer_address,:customer_dateofjoining, :customer_contact)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to customers_path, notice: error
  end

end
