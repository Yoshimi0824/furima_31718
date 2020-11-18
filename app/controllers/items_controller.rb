class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :explanation, :category_id, :condition_id, :shipping_fee_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end