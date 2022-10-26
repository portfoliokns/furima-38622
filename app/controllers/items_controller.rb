class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    
    # binding.pry
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :payment_method_id, :prefecture_id,
                                 :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  # def move_to_signed_in
  #   unless item.user_id == current_user.id
  #     redirect_to new_user_registration_path
  #   end
  # end
end
