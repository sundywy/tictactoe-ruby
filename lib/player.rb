class Player
  attr_reader :sym
  def initialize(sym)
    @sym = sym
  end

  def get_pos
    gets.chomp.split(",").map { |x| x.to_i }
  end
end
