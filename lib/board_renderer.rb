class BoardRenderer
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    board.grid.each do |cols|
      puts "-----"
      cols.each do |col|
        print col.nil? ? "  " : "#{col} "
      end
      puts ""
    end
    puts "-----"
  end
end
