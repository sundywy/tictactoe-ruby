require_relative "invalid_move_error"

WINNING_MOVES = [
  [[0, 0], [1, 0], [2, 0]],
  [[0, 1], [1, 1], [2, 1]],
  [[0, 2], [1, 2], [2, 2]],

  [[0, 0], [0, 1], [0, 2]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],

  [[0, 0], [1, 1], [2, 2]],
  [[0, 2], [1, 1], [2, 0]]
]

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

  def [](x, y)
    grid[x][y]
  end

  def full?
    grid.flatten.count(&:nil?) <= 0
  end

  def have_winner?

    WINNING_MOVES.each do |moves|

      current_row = moves.map { |x, y| self[x, y] }

      if current_row.any?(&:nil?)
        next
      end

      if current_row.uniq.count == 1
        return true
      end
    end
    false
  end

  private

  def in_bounds?(loc)
    x, y = loc
    x >= 0 && x <= 2 && y >= 0 && y <= 2
  end
end
