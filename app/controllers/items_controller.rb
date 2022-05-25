class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :quality_id, :prefecture_id, :shipping_date_id, :shipping_fee_id, :price, :image).merge(user_id: current_user.id)
  end

end