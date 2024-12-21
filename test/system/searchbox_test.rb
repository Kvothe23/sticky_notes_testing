require "application_system_test_case"

class SearchboxTest < ApplicationSystemTestCase
test "search box functionality" do

  Note.create!(title:"Test 1", content:"Test 1")
  Note.create!(title:"Test 2", content:"Test 2")
  visit notes_path

  #Both notes should be filtered
  fill_in "query", with: "Test"
  click_button "Search"
  assert_text "Test 1"
  assert_text "Test 2"
  #Only note Test 1 should be filtered
  fill_in "query", with: "1"
  click_button "Search"
  assert_text "Test 1"
  assert_no_text "Test 2"
  end
end
