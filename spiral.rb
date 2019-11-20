module Spiral
  extend self

  IMAGE_CHARACTER = '*'

  def call(length_of_spiral)
    x_location = 0
    y_location = 0

    image_map = [ [ ] ]

    (0..length_of_spiral-1).map{ |horizontal_bounds|

      empty_line = (0..length_of_spiral-1).map {
        [] << ' ';
      }
      image_map << empty_line
    }

    draw_right(image_map, x_location, y_location, length_of_spiral)
  end

  private

  def draw_right(image_map, x, y, distance)
    distance_of_line = distance - x - 1
    p image_map
    p x
    p y
    p distance

    (x..distance_of_line).each do |x_location|
      p x_location
      image_map[y][x_location] = IMAGE_CHARACTER
    end
    image_map
  end

  ## Difficult approach (first attempt):
  # def call(length_of_spiral)
    # lines = []

    # (1..length_of_spiral).each_with_index do |line, index|
      # line = IMAGE_CHARACTER * length_of_spiral
      # p "Line number: #{index}"
      # p "Actual line: #{line}"
    # end

    # lines
  # end
end


# Reference for 5
# *****\n
    # *
 # ** *
 # ** *
 # ****



