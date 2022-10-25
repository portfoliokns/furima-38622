class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :payment_method_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
