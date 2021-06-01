require_relative 'player'
require_relative 'user_interface'
require_relative 'validation'

class HumanPlayer < Player
  include Validation
  include UserInterface
  attr_accessor :output, :input

  def initialize(name, symbol)
    super(name, symbol)
    @output = $stdout
    @input = $stdin
  end

  def make_move(playing_board)
    UserInterface.see_board(playing_board.board, output)
    move = UserInterface.get_players_move(output, input)
    move if validate_move(playing_board, move)
  end
end
