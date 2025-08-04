require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url
    assert_selector "h2", count: Entry.count
  end

  test "should create entry" do
    visit new_entry_url

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Published at", with: @entry.published_at
    fill_in "Title", with: @entry.title
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "should update Entry" do
    visit entry_url(@entry)
    click_on "Edit this entry", match: :first

    fill_in "Body markdown", with: @entry.body_markdown
    check "Draft" if @entry.draft
    fill_in "Published at", with: @entry.published_at.to_s
    fill_in "Title", with: @entry.title
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry" do
    visit entry_url(@entry)
    click_on "Destroy this entry", match: :first

    assert_text "Entry was successfully destroyed"
  end
end
