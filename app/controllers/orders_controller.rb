class OrdersController < ApplicationController
  before_action :prepare_cart

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    redirect_to root_path
  end

  private

  def order_params
    # order status of 1 indicates 'Pending Payment'
    params.require(:order).permit(:updated_at)
          .merge(order_status_id: 1, user_id: @user.id,
                 total: (@cart_total + @tax_total).round(2),
                 tax_total: @tax_total.round(2))
  end

  def prepare_cart
    @cart_products = Product.find(session[:cart])
    @user = User.find(session[:user_id])
    @cart_total = @cart_products.sum(&:price)

    @tax_total = @user.province.hst_rate != 0 ?
                     (@cart_total *
                         (@user.province.hst_rate / 100)) :
                     (@cart_total *
                         ((@user.province.country.gst_rate / 100) +
                         (@user.province.pst_rate / 100)))
  end
end
