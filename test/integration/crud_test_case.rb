require "test_helper"

class CrudTestCase < ActionDispatch::IntegrationTest
setup do
  @note =Note.create(title: "Test", content: "Test")
end

test "it should CREATE, READ, UPDATE and DELETE notes" do
#CREATE
  post notes_path, params: { note: { title: "New", content: "New"} }
  assert_redirected_to note_path(Note.last)
  follow_redirect!
  assert_response :success
  assert_select "h2", text: "New"
#READ (SHOW)
  get notes_path
  assert_response :success
  assert_select "h5.card-title", text: "Test"
#UPDATE (EDIT)
  patch note_path(@note), params: { note: { title: "Test2" } }
  assert_redirected_to note_path(@note)
  follow_redirect!
  assert_response :success
  assert_select "h2", text: "Test2"
#DELETE
  delete note_path(@note)
  assert_redirected_to notes_path
  follow_redirect!
  assert_response :success
  assert_select "h5.card-title", text: "Test2", count:0
end
end
