require "test_helper"

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "unauthenticated user should be redirected when accessing index" do
    get admin_entries_url

    assert_redirected_to new_session_url
  end

  test "authenticated user should get index" do
    sign_in_as users(:one)

    get admin_entries_url
    assert_response :success
  end

  test "unauthenticated user should be redirected when accessing new" do
    get new_admin_entry_url

    assert_redirected_to new_session_url
  end

  test "authenticated user should get new" do
    sign_in_as users(:one)

    get new_admin_entry_url
    assert_response :success
  end

  test "unauthenticated user should be redirected when creating entry" do
    assert_no_difference("Entry.count") do
      post admin_entries_url, params: { entry: { body_markdown: @entry.body_markdown, draft: @entry.draft, published_at: @entry.published_at, title: @entry.title } }
    end

    assert_redirected_to new_session_url
  end

  test "authenticated user should create entry" do
    sign_in_as users(:one)

    assert_difference("Entry.count") do
      post admin_entries_url, params: { entry: { body_markdown: @entry.body_markdown, draft: @entry.draft, published_at: @entry.published_at, title: @entry.title } }
    end

    assert_redirected_to edit_admin_entry_url(Entry.last)
  end

  test "unauthenticated user should be redirected when accessing edit" do
    get edit_admin_entry_url(@entry)

    assert_redirected_to new_session_url
  end

  test "authenticated user should get edit" do
    sign_in_as users(:one)

    get edit_admin_entry_url(@entry)
    assert_response :success
  end

  test "unauthenticated user should be redirected when updating entry" do
    patch admin_entry_url(@entry)

    assert_redirected_to new_session_url
  end

  test "authenticated user should update entry" do
    sign_in_as users(:one)

    patch admin_entry_url(@entry), params: { entry: { body_html: @entry.body_html, body_markdown: @entry.body_markdown, draft: @entry.draft, published_at: @entry.published_at, title: @entry.title } }
    assert_redirected_to admin_entry_url(@entry)
  end

  test "unauthenticated user should be redirected when destroying entry" do
    assert_no_difference("Entry.count") do
      delete admin_entry_url(@entry)
    end

    assert_redirected_to new_session_url
  end

  test "authenticated user should destroy entry" do
    sign_in_as users(:one)

    assert_difference("Entry.count", -1) do
      delete admin_entry_url(@entry)
    end

    assert_redirected_to admin_entries_url
  end
end
