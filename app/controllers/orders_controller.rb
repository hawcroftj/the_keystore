class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save!
  end

  def index
    @cart_products = Product.find(session[:cart])
    @user_province = Province.find(User.find(session[:user_id]).province_id)
    @user_country = Country.find(@user_province.country_id)

    @local_tax = @user_province.pst_rate
    @federal_tax =
        @user_province.hst_rate > 0 ?
            @user_province.hst_rate :
            @user_country.gst_rate

    @subtotal = @cart_products.sum(&:price)
    @total =
        @subtotal +
            ((@local_tax / 100) * @subtotal) +
            ((@federal_tax / 100) * @subtotal)
  end

  private

  def order_params
    params.require(:order).permit(:status_id, :user_id)
  end
end
