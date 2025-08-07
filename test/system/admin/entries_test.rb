require "application_system_test_case"

class Admin::EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit admin_entries_url
    assert_selector "tbody tr", count: Entry.count
  end

  test "should create entry" do
    visit new_admin_entry_url

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Published at", with: @entry.published_at
    fill_in "Title", with: @entry.title
    click_on "Create Entry"

    assert_text "Entry was successfully created"
  end

  test "should update Entry" do
    visit edit_admin_entry_url(@entry)

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Published at", with: @entry.published_at.to_s
    fill_in "Title", with: @entry.title
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
  end

  # TODO: will enable after adding authentication/authorization
  # test "should destroy Entry" do
  #   visit entry_slug_url(@entry.slug)
  #   click_on "Destroy this entry", match: :first

  #   assert_text "Entry was successfully destroyed"
  # end
end
