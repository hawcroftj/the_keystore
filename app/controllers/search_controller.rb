class SearchController < ApplicationController
  def products
    @terms = params[:q]
    @products = Product.where("name LIKE (?)", "%#{@terms}%")
  end

  def categories
    @terms = params[:q]
    @category = Category.where("name LIKE (?)", "%#{@terms}%")
  end
end
