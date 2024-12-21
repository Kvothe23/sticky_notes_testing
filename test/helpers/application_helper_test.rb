require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "Assigns different colors to notes in a cycle" do
    assert_equal "yellow", note_color(0)
    assert_equal "pink", note_color(1)
    assert_equal "blue", note_color(2)
    assert_equal "green", note_color(3)
    assert_equal "orange", note_color(4)
    assert_equal "yellow", note_color(5)
  end
end