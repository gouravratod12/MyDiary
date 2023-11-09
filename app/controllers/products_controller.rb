class ProductsController < ApplicationController


  before_action :set_product, only: [:edit, :update , :show , :destroy]

  def index
    @items = Item.all
    @bills = Bill.all
    @pagy,@products = pagy(search_products)
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

  def details
    @product = Product.find(params[:id])
     render json: {
      rate: @product.product_rate,
      unit: @product.unit,
      name: @product.product_name

    }
  end


  private
  def search_products
    query = params[:query]
    search_option = params[:search_by]

    conditions = {
      'Product Name' => :product_name,
      'Product Rate' => :product_rate,
      'Product Stock' => :stock,

    }

    search_column = conditions[search_option]

    if query.present? && search_column
      Product.where("#{search_column} LIKE ?", "%#{query}%").order(:product_name)
    else
      Product.all.order(:product_name)
    end
  end

  def product_params
    params.require(:product).permit(:product_name, :product_rate,:unit,:stock)
  end

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to products_path, notice: error
  end
end