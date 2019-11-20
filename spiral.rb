require './canvas.rb'

module Spiral
  extend self

  def call(size: 12)
    canvas = Canvas.new(size: size)
    spiral_arm_count = size

    while spiral_arm_count >= 0
      canvas.draw_right(spiral_arm_count)

      # make sure the first and second lines are the same sizes
      if spiral_arm_count != size
        spiral_arm_count -= 1
      end

      canvas.draw_down(spiral_arm_count)
      spiral_arm_count -= 1

      canvas.draw_left(spiral_arm_count)
      spiral_arm_count -= 1

      canvas.draw_up(spiral_arm_count)
      spiral_arm_count -= 1

    end

    canvas.pretty
  end
end

