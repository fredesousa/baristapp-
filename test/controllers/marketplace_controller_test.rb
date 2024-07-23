require "test_helper"

class MarketplaceControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get marketplace_show_url
    assert_response :success
  end
end
