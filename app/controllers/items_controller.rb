class ItemsController < ApplicationController

  before_action :set_item , only: [:edit, :update , :show , :destroy]


  def index
    @item = Item.all
    @product = Product.all
    @bill    = Bill.all
    if params[:query].present?
      @items = Item.joins(:bill).where("bill_id = ?", params[:query])
    else
      @items = Item.all
    end
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
    rescue ActiveRecord::RecordNotUnique
    redirect_to items_path, alert: 'Item with the same product and bill already exists'
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

  def rate
     product.product_rate
  end

  def unit
    product.unit
  end


  private

  def item_params
    params.require(:item).permit(:product_id,:unit,:bill_id,:item_id,:weight,:amount)
  end

  def set_item
    @item = Item.find(params[:item_id] || params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to items_params_path, notice: error
  end


end
