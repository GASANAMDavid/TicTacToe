require_relative 'player'

class HumanPlayer < Player
  def see_board(output = $stdout)
    current_board.print_board(output)
  end
end
