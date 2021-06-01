module GameStatus
  def self.find_board_status(current_player, playing_board)
    case playing_board.board_state(current_player.symbol)
    when 'Tie'
      "It's a Draw"
    when 'Winner'
      "#{current_player.name} won the game"
    end
  end
end
