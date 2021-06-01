require_relative 'user_interface'
class GameEngine
  include UserInterface
  attr_reader :playing_board, :player1, :player2

  def initialize(board, player1, player2)
    @playing_board = board
    @player1 = player1
    @player2 = player2
  end

  def play
    current_player = player1
    loop do
      UserInterface.display_which_player_turn(current_player)
      move = current_player.make_move(playing_board)
      next if move.nil?

      playing_board.apply_move(current_player.symbol, move)

      return find_board_status(current_player) unless find_board_status(current_player).nil?

      current_player = switch_players(current_player)
    end
  end

  def find_board_status(current_player)
    case playing_board.board_state(current_player.symbol)
    when 'Tie'
      "It's a Draw"
    when 'Winner'
      "#{current_player.name} won the game"
    end
  end

  private

  def switch_players(current_player)
    if current_player == player1
      player2
    else
      player1
    end
  end
end
