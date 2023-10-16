class CustomersController < ApplicationController
  def index
    @customers = Customer.all
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
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path, notice: 'Customer has been updated succesfully'
    else
      render :edit
  end
end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :customer_address,:customer_dateofjoining, :customer_contact)
  end

end
