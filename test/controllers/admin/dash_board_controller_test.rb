require "test_helper"

class Admin::DashBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dash_board_index_url
    assert_response :success
  end
end
