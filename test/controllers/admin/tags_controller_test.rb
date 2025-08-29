require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_tags_new_url
    assert_response :success
  end
end
