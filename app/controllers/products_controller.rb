class ProductsController < ApplicationController


  before_action :set_product, only: [:edit, :update , :show , :destroy]

  def index
    @products = Product.all
    @items = Item.all
    @bills = Bill.all
  end

  def new
    @product  = Product.new
  end

  def create

    @product  = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product has been created successfully'

    else
      render :new
    end
  end

  def edit

  end

  def update

    if @product.update(product_params)
      redirect_to  edit_product_path, notice: 'product has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: 'Product has been deleted succesfully'
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_rate,:unit)
  end

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to products_path, notice: error
  end
end