require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
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
