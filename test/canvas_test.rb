require 'minitest/autorun'
require './canvas.rb'

class CanvasTest < Minitest::Test
  def test_canvas_is_initialized_with_the_proper_grid_size
    canvas = default_size_three_canvas
    expected_result = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' '],
    ]

    assert_equal expected_result, canvas.grid
  end

  def test_canvas_is_initialized_with_the_cursor_at_the_top_left
    canvas = default_size_three_canvas
    assert_equal 0, canvas.cursor_x
    assert_equal 0, canvas.cursor_y
  end

  def test_canvas_can_draw_right_for_the_distance_specified
    canvas = default_size_three_canvas

    canvas.draw_right(3)
    expected_result = [
      ['*', '*', '*'],
      [' ', ' ', ' '],
      [' ', ' ', ' '],
    ]

    assert_equal expected_result, canvas.grid
  end

  def test_canvas_can_draw_left_for_the_distance_specified
    canvas = Canvas.new(size: 3, cursor_x: 0, cursor_y: 2)

    canvas.draw_left(3)
    expected_result = [
      ['*', '*', '*'],
      [' ', ' ', ' '],
      [' ', ' ', ' '],
    ]

    assert_equal expected_result, canvas.grid
  end

  def test_canvas_can_draw_down_for_the_distance_specified
    canvas = Canvas.new(size: 3, cursor_x: 0, cursor_y: 0)

    canvas.draw_down(3)
    expected_result = [
      ['*', ' ', ' '],
      ['*', ' ', ' '],
      ['*', ' ', ' '],
    ]

    assert_equal expected_result, canvas.grid
  end

  def test_canvas_can_draw_up_for_the_distance_specified
    canvas = Canvas.new(size: 3, cursor_x: 2, cursor_y: 2)

    canvas.draw_up(3)
    expected_result = [
      [' ', ' ', '*'],
      [' ', ' ', '*'],
      [' ', ' ', '*'],
    ]

    assert_equal expected_result, canvas.grid
  end

  private

  def default_size_three_canvas
    Canvas.new(size: 3)
  end
end
