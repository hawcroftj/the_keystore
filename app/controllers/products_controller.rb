class ProductsController < ApplicationController
  def index
    # get all products ordered by name, 9 per page
    @products = Product.order(:name).page(params[:page]).per(9)
  end

  def new
    # get all products created within the last 3 days
    @products = Product.where(created_at: Date.today - 3..Date.today + 1)
                    .order('created_at DESC')
                    .page(params[:page]).per(9)
  end

  def updated
    # get all products updated within the last 3 days
    @products = Product.where(updated_at: Date.today - 3..Date.today + 1)
                    .order('updated_at DESC')
                    .page(params[:page]).per(9)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
      redirect_to root_path
    end
  end

  def remove_from_cart
    id = params[:id].to_i

    if session[:cart].include?(id)
      session[:cart].delete(id)
      redirect_to root_path
    end
  end
end
