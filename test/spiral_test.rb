require 'minitest/autorun'
require './spiral.rb'

class SpiralTest < Minitest::Test
  def test_responds_to_call_with_a_parameter
    assert Spiral.respond_to?(:call)
  end

  def test_raises_an_exception_without_a_parameter
    assert_raises ArgumentError do
      Spiral.call()
    end
  end

  def test_prints_out_the_correct_spiral_for_a_the_parameter_of_12
    expected_image =
      "************\n" +
      "           *\n"  +
      " ********* *\n"
    assert_equal expected_image, Spiral.call(12)
  end

  # def test_prints_out_the_second_line_as_11_spaces_and_1_star_when_given_a_parameter_of_12
    # assert_equal "           *", Spiral.call(12)
  # end
end

class CanvasTest < Minitest::Test
  def test_canvas_is_initialized_with_the_proper_grid_size
    canvas = default_canvas
    expected_result = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' '],
    ]

    assert_equal expected_result, canvas.grid
  end

  def test_canvas_is_initialized_with_the_cursor_at_the_top_left
    canvas = default_canvas
    assert_equal 0, canvas.cursor_x
    assert_equal 0, canvas.cursor_y
  end

  # def test_canvas_can_draw_right_for_the_distance_specified
    # canvas = default_canvas

    # canvas
  # end

  private

  def default_canvas
    Canvas.new(size: 3)
  end
end
