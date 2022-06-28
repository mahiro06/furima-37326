class UsersController < ApplicationController
  before_action :set_item, only: :show

  def show
    @user = User.all.find(params[:id])
    @rops = Rop.where(user_id: params[:id]).pluck(:item_id)
    @item = Item.find(@rops)
  end

  private
  def set_item
    @items = Item.where(user_id: params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :quality_id, :prefecture_id, :shipping_date_id,
                                 :shipping_fee_id, :price, :image)
  end

  def rop_params
    params.require(:rop).permit(:item_id).merge(user_id: current_user.id )
  end

end
