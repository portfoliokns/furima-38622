class OrdersController < ApplicationController
  def index
    # binding.pry
    @item = Item.find(params[:item_id])
  end

  def create
  end
end
