require_relative "invalid_move_error"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def place(loc, sym)
    x, y = loc

    if !in_bounds?(loc)
      raise InvalidMoveError.new("Location out of bounds")
    end

    if !grid[x][y].nil?
      raise InvalidMoveError.new("Not empty space")
    end

    grid[x][y] = sym
  end

  private

  def in_bounds?(loc)
    x, y = loc
    x >= 0 && x <= 2 && y >= 0 && y <= 2
  end
end
