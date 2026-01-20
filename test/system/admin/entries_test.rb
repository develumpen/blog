require "application_system_test_case"

class Admin::EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    sign_in_as users(:one)

    visit admin_entries_url
    assert_selector "tbody tr", count: Entry.count
  end

  test "should create entry" do
    sign_in_as users(:one)

    visit new_admin_entry_url

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Published at", with: @entry.published_at
    fill_in "Title", with: @entry.title
    click_on "Create Entry"

    assert_text "Entry was successfully created"
  end

  test "should update Entry" do
    sign_in_as users(:one)

    visit edit_admin_entry_url(@entry)

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Title", with: @entry.title
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
  end

  test "should destroy Entry" do
    sign_in_as users(:one)

    visit edit_admin_entry_url(@entry)
    accept_confirm do
      click_on "Destroy Entry", match: :first
    end

    assert_text "Entry was successfully destroyed"
  end
end
