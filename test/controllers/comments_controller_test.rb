require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "cannot leave an empty comment" do
    assert_no_difference("Comment.count") do
      post entry_comments_url(@entry), params: { comment: { name: "Comentor" } }
    end

    assert_response :unprocessable_content
  end

  test "signed in user can leave a comment" do
    @user = users(:one)
    sign_in_as @user

    assert_difference("Comment.count") do
      post entry_comments_url(@entry), params: { comment: { comment: "Comment body." } }
    end

    assert_redirected_to entry_slug_url(@entry.slug)
  end

  test "a comment can have no name" do
    assert_difference("Comment.count") do
      post entry_comments_url(@entry), params: { comment: { comment: "Comment body." } }
    end

    assert_redirected_to entry_slug_url(@entry.slug)
  end
end
