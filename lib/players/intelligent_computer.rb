require_relative 'player'

class IntelligentComputer < Player
  def make_move(playing_board)
    depth = playing_board.board.size
    minimax(playing_board, depth, true)
  end

  def minimax(current_board, depth, _is_minimizing)
    return +1 if current_board.board_state('X') == 'Winner'
    return -1 if current_board.board_state('O') == 'Winner'
    return 0 if current_board.board_state('X') == 'Tie'
    return 0 if current_board.board_state('O') == 'Tie'

    current_board.apply_move(9, 'X')
    minimax(current_board, depth - 1, false)
  end
end
