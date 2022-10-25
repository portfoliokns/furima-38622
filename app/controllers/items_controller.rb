class ItemsController < ApplicationController
  def index
    # @categories = Category.order("created_at DESC")
  end

  def new
    # @category = Category.new
  end

  private

  def item_params
    # params.require(:item).permit(:name, :description, :category_id, :status_id, :payment_method_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
