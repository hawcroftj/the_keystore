class SearchController < ApplicationController
  def products
    @terms = params[:q].downcase
    if params[:category_id].blank?
      @products = Product.where("name LIKE lower(?)", "%#{@terms}%")
    else
      category = Category.find(params[:category_id])
      @products = category.products.where("name LIKE lower(?)", "%#{@terms}%")
    end
  end
end
