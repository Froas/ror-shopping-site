require "test_helper"

class OrderLineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get order_line_items_show_url
    assert_response :success
  end

  test "should get new" do
    get order_line_items_new_url
    assert_response :success
  end

  test "should get index" do
    get order_line_items_index_url
    assert_response :success
  end
end
