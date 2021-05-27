require_relative 'player'
require_relative 'user_interface'

class HumanPlayer < Player
  attr_reader :interface

  def initialize(name, symbol)
    super(name, symbol)
    @interface = UserInterface.new
  end

  def make_move(playing_board)
    interface.see_board(playing_board.board)
    free_spaces = playing_board.blank_positions
    interface.see_available_free_position(free_spaces)
    move = interface.get_players_move
    return playing_board.apply_move(symbol, free_spaces[move]) if free_spaces.key?(move)

    puts 'Invalid move:'
    make_move(playing_board)
  end
end
