require "test_helper"

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    sign_in_as users(:one)

    get admin_entries_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as users(:one)

    get new_admin_entry_url
    assert_response :success
  end

  test "should create entry" do
    sign_in_as users(:one)

    assert_difference("Entry.count") do
      post admin_entries_url, params: { entry: { body_markdown: @entry.body_markdown, draft: @entry.draft, published_at: @entry.published_at, title: @entry.title } }
    end

    assert_redirected_to edit_admin_entry_url(Entry.last)
  end

  test "should get edit" do
    sign_in_as users(:one)

    get edit_admin_entry_url(@entry)
    assert_response :success
  end

  test "should update entry" do
    sign_in_as users(:one)

    patch admin_entry_url(@entry), params: { entry: { body_html: @entry.body_html, body_markdown: @entry.body_markdown, draft: @entry.draft, published_at: @entry.published_at, title: @entry.title } }
    assert_redirected_to admin_entry_url(@entry)
  end

  test "should destroy entry" do
    sign_in_as users(:one)

    assert_difference("Entry.count", -1) do
      delete admin_entry_url(@entry)
    end

    assert_redirected_to admin_entries_url
  end
end
