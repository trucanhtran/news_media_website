require "test_helper"

class ZingnewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zingnews_index_url
    assert_response :success
  end
end
