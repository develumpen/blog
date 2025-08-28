require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "should create comment for user" do
    @user = users(:one)
    sign_in_as @user

    visit entry_slug_url(@entry.slug)

    fill_in "Comment", with: "This is a comment."
    click_on "Create Comment"

    assert_selector ".comment", count: 2
    assert_selector ".comment-author > a", text: @user.username
  end

  test "should create comment for a guest without url" do
    visit entry_slug_url(@entry.slug)

    fill_in "Name", with: "Comentator"
    fill_in "Comment", with: "This is a comment."
    click_on "Create Comment"

    assert_selector ".comment", count: 2
    assert_selector ".comment-author > span", text: "Comentator"
  end

  test "should create comment for a guest with url" do
    visit entry_slug_url(@entry.slug)

    fill_in "Name", with: "Comentator"
    fill_in "Url", with: "http://my-url.com"
    fill_in "Comment", with: "This is a comment."
    click_on "Create Comment"

    assert_selector ".comment", count: 2
    assert_selector ".comment-author > a", text: "Comentator"
  end

  test "should create comment for anonymous" do
    visit entry_slug_url(@entry.slug)

    fill_in "Comment", with: "This is a comment"
    click_on "Create Comment"

    assert_selector ".comment", count: 2
    assert_selector ".comment-author > span", text: "anónimo"
  end

  test "should show error if comment is empty" do
    visit entry_slug_url(@entry.slug)

    click_on "Create Comment"

    assert_selector "li", text: "Comment can't be blank"
  end
end
