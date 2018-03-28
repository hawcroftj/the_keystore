class SearchController < ApplicationController
  def products
    @terms = params[:q]
    if params[:category_id].blank?
      @products = Product.where("name LIKE (?)", "%#{@terms}%")
    else
      category = Category.find(params[:category_id])
      @products = category.products.where("name LIKE (?)", "%#{@terms}%")
    end
  end
end
