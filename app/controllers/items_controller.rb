class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  # def index 
  #   @items = Item.order("created_at DESC")
  # end

  # def edit
  # end

  # def update
  #   @item.update(item_params)
  #   redirect_to root_path
  # end

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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :item,
      :image,
      :days_to_ship_id,
      :text,
      :price,
      :shipping_prefecture_id,
      :condition_id,
      :shipping_burden_id,
      :genre_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
  end
  end
end