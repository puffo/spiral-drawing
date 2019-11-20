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
