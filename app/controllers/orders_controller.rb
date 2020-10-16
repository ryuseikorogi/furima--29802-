class OrdersController < ApplicationController
  before_action :Pay_form, only:[:index, :create]
  
  def index
    @order = PayForm.new
  end

  def create
    @order = PayForm.new(order_params)
  

   if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
end

   private
   def Pay_form
   @item = Item.find(params[:item_id])
   end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,
        card: order_params[:token],
        currency:'jpy'
      )
    end

    def order_params
      params.require(:pay_form).permit(:shipping_prefecture_id, :address, :zip_code, :city, :building, :phone_number).merge(token: params[:token], user_id: current_user.id ,item_id: params[:item_id])
    end
  end
