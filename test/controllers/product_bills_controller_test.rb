require 'test_helper'

class ProductBillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_bills_index_url
    assert_response :success
  end

end
