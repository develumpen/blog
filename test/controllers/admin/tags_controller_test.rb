require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get index" do
    sign_in_as users(:one)

    get admin_tags_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as users(:one)

    get new_admin_tag_url
    assert_response :success
  end

  test "should create tag" do
    sign_in_as users(:one)

    assert_difference("Tag.count") do
      post admin_tags_url, params: { tag: { name: "newTag" } }
    end

    assert_redirected_to admin_tags_url
  end

  test "should get edit" do
    sign_in_as users(:one)

    get edit_admin_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    sign_in_as users(:one)

    patch admin_tag_url(@tag), params: { tag: { name: "updatedTag" } }

    @tag.reload

    assert_redirected_to admin_tags_url
    assert_equal "updatedTag", @tag.name
  end

  test "should destroy tag" do
    sign_in_as users(:one)

    assert_difference("Tag.count", -1) do
      delete admin_tag_url(@tag)
    end

    assert_redirected_to admin_tags_url
  end
end
