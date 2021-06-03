require_relative 'player'
require_relative '../user_interface'
require_relative '../validation'

class Human < Player
  include Validation
  include UserInterface

  def make_move(playing_board)
    UserInterface.see_board(playing_board.board)
    move = UserInterface.get_players_move
    move if validate_move(playing_board, move)
  end
end
