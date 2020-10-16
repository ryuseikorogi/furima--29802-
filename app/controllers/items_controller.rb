class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, except: [:index, :show, :delete]
  def index
    @items = Item.order('created_at DESC')
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
  end
end

  def destroy
    if @item.destroy && current_user.id == @item.user_id
      redirect_to root_path
    else
      render :show
    end
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
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :item_name,
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
    redirect_to action: :index unless user_signed_in?
  end
end
