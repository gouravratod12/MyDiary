class ItemsController < ApplicationController

  before_action :set_item , only: [:edit, :update , :show , :destroy]


  def index
    @items = Item.all
    @product = Product.all
  end

  def new
    @item  = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item has been created successfully'

    else
      render :new
    end
  end
  def edit

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to edit_item_path, notice: 'Item Stock has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy


    if @item.destroy
      redirect_to item_path, notice: 'Item has been deleted succesfully'
    end

   end


  private

  def item_params
    params.require(:item).permit( :product_date ,:product_stock,:product_unit,:product_id,:product_unit)
  end

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to items_params_path, notice: error
  end


end
