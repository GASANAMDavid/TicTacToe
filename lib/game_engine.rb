class GameEngine
  attr_reader :board, :player1, :player2

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def play
    current_player = player1
    loop do
      puts "#{current_player.name}'s turn"
      current_player.make_move(board)
      return find_board_status(current_player) unless find_board_status(current_player).nil?

      current_player = switch_players(current_player)
    end
  end

  # private

  def switch_players(current_player)
    if current_player == player1
      player2
    else
      player1
    end
  end

  def find_board_status(current_player)
    case board.game_state
    when 'Tie'
      "It's a Draw"
    when 'Winner'
      "#{current_player.name} won the game"
    end
  end
end
