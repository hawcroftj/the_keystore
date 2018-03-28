class CategoriesController < ApplicationController
  def show
    @products = Category.products.all
  end
end
