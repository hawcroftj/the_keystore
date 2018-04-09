class OrdersController < ApplicationController
  def new
    @cart_products = Product.find(session[:cart])
    @user = session[:current_user]
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:status_id, :user_id, :total, :tax_total)
  end
end
