class SellersController < ApplicationController
  before_action :set_seller, only: [:edit, :update , :show , :destroy]
  include Pagy::Backend

  def index
    @pagy, @sellers = pagy(Seller.all)
    @pagy, @sellers = pagy(search_sellers)

  end

  def new
    @seller  = Seller.new
  end

  def create
    @seller  = Seller.new(seller_params)

    if @seller.save
      redirect_to sellers_path, notice: 'Seller has been created successfully'

    else
      render :new
    end
  end

  def edit

  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to edit_seller_path, notice: 'Seller has been updated succesfully'
    else
      render :edit
   end
 end

  def show

  end

  def destroy


    if @seller.destroy
      redirect_to sellers_path, notice: 'Seller has been deleted succesfully'
    end
  end

  private
  def search_sellers
    query = params[:query]
    search_option = params[:search_by]

    conditions = {
      'Seller Name' => :seller_name,
      'Seller Address' => :seller_address,
      'Date of Joining' => :seller_date,
      'Contacts' => :seller_contact
    }

    search_column = conditions[search_option]

    if query.present? && search_column
      Seller.where("#{search_column} LIKE ?", "%#{query}%").order(:seller_name)
    else
      Seller.all.order(:seller_name)
    end
  end


  def seller_params
    params.require(:seller).permit(:seller_name, :seller_address,:seller_date, :seller_contact)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to sellers_path, notice: error
  end

end
