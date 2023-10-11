require_relative "player"
require_relative "board"
require_relative "board_renderer"

class Game
  attr_reader :player1, :player2, :renderer
  attr_accessor :current_player, :board

  def initialize
    @player1 = Player.new(:X)
    @player2 = Player.new(:O)
    @board = Board.new
    @current_player = @player1
    @renderer = BoardRenderer.new(board)
  end

  def run
    loop do
      renderer.render

      puts "It's #{current_player.sym}'s turn"
      puts "Please take a move"
      loop do
        pos = get_pos
        board.place(pos, current_player.sym)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
      swap_player!
    end
  end

  private

  def get_pos
    gets.chomp.split(",").map { |x| x.to_i }
  end

  def swap_player!
    self.current_player = (current_player == player1) ? player2 : player1
  end
end
