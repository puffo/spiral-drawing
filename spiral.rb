module Spiral
  extend self

  IMAGE_CHARACTER = '*'

  def call(length_of_spiral)
    x_location = 0
    y_location = 0

    canvas = [ [ ] ]

    (0..length_of_spiral-1).map{ |horizontal_bounds|

      empty_line = (0..length_of_spiral-1).map {
        [] << ' ';
      }
      canvas << empty_line
    }

    draw_right(canvas, x_location, y_location, length_of_spiral)
  end

  private

  def draw_right(canvas, x, y, distance)
    distance_of_line = distance - x - 1
    # p canvas
    # p x
    # p y
    # p distance

    (x..distance_of_line).each do |x_location|
      # p x_location
      canvas[y][x_location] = IMAGE_CHARACTER
    end
    canvas
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

class Canvas
  attr_reader :grid, :cursor_x, :cursor_y

  EMPTY_CHARACTER   = ' '
  WRITTEN_CHARACTER = '*'

  def initialize(size: 5, cursor_x: 0, cursor_y: 0)
    @grid     = initialize_empty_grid(size)
    @cursor_x = cursor_x
    @cursor_y = cursor_y
  end

  def draw_right(distance)
    write_at_current_location

    (distance-1).times do
      @cursor_y += 1
      write_at_current_location
    end
  end

  def draw_left(distance)
    write_at_current_location

    (distance-1).times do
      @cursor_y -= 1
      write_at_current_location
    end
  end

  def draw_down(distance)
    write_at_current_location

    (distance-1).times do
      @cursor_x += 1
      write_at_current_location
    end
  end

  def draw_up(distance)
    write_at_current_location

    (distance-1).times do
      @cursor_x -= 1
      write_at_current_location
    end
  end

  private

  def write_at_current_location
    @grid[@cursor_x][@cursor_y] = WRITTEN_CHARACTER
    # debug('Writing')
  end

  def initialize_empty_grid(grid_dimension)
    grid_map  = []
    grid_single_row  = []

    grid_dimension.times do
      grid_single_row << EMPTY_CHARACTER
    end

    grid_dimension.times do
      grid_map << grid_single_row.dup
    end

    grid_map
  end

  def debug(operation)
    p operation
    p "X: #{@cursor_x} | Y: #{@cursor_y}"
    p @grid
  end
end













# Reference for 5
# *****\n
    # *
 # ** *
 # ** *
 # ****



