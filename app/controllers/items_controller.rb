class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  before_action :move_to_index, only: [:edit]

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
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :payment_method_id, :prefecture_id,
                                 :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
