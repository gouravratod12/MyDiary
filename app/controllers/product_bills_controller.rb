class ProductBillsController < ApplicationController

  before_action :set_product_bill, only: [:edit, :update , :show , :destroy]


  def index
    @product_bills = ProductBill.all
  end

  def new
    @product_bill  = ProductBill.new
  end

  def create
    @product_bill  = ProductBill.new(product_bill_params)
    if @product_bill.save
      redirect_to product_bills_path, notice: 'Product Bill has been created successfully'

    else
      render :new
    end
  end
  def edit

  end

  def update
    @product_bill = ProductBill.find(params[:id])
    if @product_bill.update(product_bill_params)
      redirect_to edit_product_bill_path, notice: 'Product Bill has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy


    if @product_bill.destroy
      redirect_to product_bill_path, notice: 'Product Bill has been deleted succesfully'
    end

   end


  private

  def product_bill_params
    params.require(:product_bill).permit( :product_date ,:product_stock,:product_unit,:product_id)
  end

  def set_product_bill
    @product_bill = ProductBill.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to product_bills_params_path, notice: error
  end


end
