module Spiral
  extend self

  def call(size: size)
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

  def pretty
    @grid.each do |row|
      p row.join(' ')
    end
  end

  def debug(operation)
    p operation
    p "X: #{@cursor_x} | Y: #{@cursor_y}"
    self.pretty
  end

  private

  def write_at_current_location
    @grid[@cursor_x][@cursor_y] = WRITTEN_CHARACTER
    # debug('Writing')        # uncomment to debug for problems
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
end

