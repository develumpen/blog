require "test_helper"

class Admin::MediaItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_media_items_url
    assert_response :success
  end
end
