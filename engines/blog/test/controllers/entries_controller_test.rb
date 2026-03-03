require "test_helper"

module Blog
  class EntriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @entry = blog_entries(:one)
    end

    test "should get index" do
      get entries_url
      assert_response :success
    end

    test "should show entry" do
      get entry_slug_url(@entry.slug)
      assert_response :success
    end
  end
end
