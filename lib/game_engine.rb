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
    loop do
      UserInterface.display_which_player_turn(current_player)
      move = current_player.make_move(playing_board)
      next if move.nil?

      playing_board.apply_move(current_player.symbol, move)

      game_status = GameStatus.find_game_status(current_player, playing_board)

      unless game_status.nil?
        UserInterface.display_game_outcome(game_status)
        break
      end

      current_player = switch_players(current_player)
    end
  end

  private

  def switch_players(current_player)
    if current_player == first_player
      second_player
    else
      first_player
    end
  end
end
