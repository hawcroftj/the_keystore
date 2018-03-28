require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get products" do
    get search_products_url
    assert_response :success
  end

  test "should get categories" do
    get search_categories_url
    assert_response :success
  end

end
