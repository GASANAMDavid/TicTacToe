require_relative 'user_interface'
require_relative 'game_status'
require 'stringio'
# GameEngine acts as an engine for TIC TOE TOE to allow players to play the game by taking turns.
class GameEngine
  include UserInterface
  attr_reader :playing_board, :first_player, :second_player

  def initialize(board, first_player, second_player)
    @playing_board = board
    @first_player = first_player
    @second_player = second_player
  end

  def play
    current_player = first_player
    game_on = true
    while game_on
      UserInterface.display_which_player_turn(current_player)
      move = current_player.make_move(playing_board)
      next unless move

      playing_board.apply_move(current_player.symbol, move)

      game_status = GameStatus.find(current_player, playing_board)

      if game_status
        system('clear')
        UserInterface.see_board(playing_board.board)
        UserInterface.display_game_outcome(game_status)
        game_on = false
      end

      current_player = switch_players(current_player)
    end
  end

  private

  def switch_players(current_player)
    current_player == first_player ? second_player : first_player
  end
end
