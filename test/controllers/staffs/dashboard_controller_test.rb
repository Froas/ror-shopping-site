require "test_helper"

class Staffs::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staffs_dashboard_index_url
    assert_response :success
  end
end
