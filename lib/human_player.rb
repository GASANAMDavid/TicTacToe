require_relative 'player'

class HumanPlayer < Player
  def initialize(name, symbol, board)
    super(name, symbol, board)
  end

  def see_board(output = $stdout)
    curr_board.print_board(output)
  end
end
