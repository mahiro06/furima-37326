class RopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @rop_order = RopForm.new
  end

  def create
    @rop_order = RopForm.new(order_params)
    if @rop_order.valid?
      pay_item
      @rop_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      unless Rop.find_by(item_id: params[:item_id]).nil? 
        redirect_to root_path
      end
    end 
  end

  def order_params
    params.require(:rop_form).permit(:postal_code, :prefecture_id, :city, :building_address, :building, :tell).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
