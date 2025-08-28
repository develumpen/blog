require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url

    assert_selector "h2", count: Entry.count
  end

  test "visiting an entry" do
    visit entry_slug_url(@entry.slug)

    assert_selector "h2", count: 1, text: @entry.title

    # @entry has 2 tags (check fixtures):
    assert_selector "span.tag", count: 2
  end
end
