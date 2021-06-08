require_relative 'player'

class IntelligentComputer < Player
  def make_move(playing_board)
    best_move = -1
    best_score = -1.0 / 0
    available_positions = playing_board.blank_positions.clone
    available_positions.each do |key, move|
      playing_board.apply_move('O', key)
      static_evaluation_score = minimax(playing_board, false)
      playing_board.reset_move(move)
      if static_evaluation_score > best_score
        best_move = key
        best_score = static_evaluation_score
      end
    end

    best_move
  end

  def minimax(current_board, is_maxmizing)
    score = compute_score(current_board)
    return score if score

    scores = []
    available_positions = current_board.blank_positions.clone
    player_symbol = is_maxmizing ? 'O' : 'X'
    available_positions.each do |key, move|
      current_board.apply_move(player_symbol, key)
      score = minimax(current_board, !is_maxmizing)
      current_board.reset_move(move)
      scores << score if score
    end
    is_maxmizing ? scores.max : scores.min
  end

  def compute_score(current_board)
    return +1 if current_board.board_state('O') == ('Winner')
    return -1 if current_board.board_state('X') == ('Winner')
    return 0 if current_board.board_state('X') == 'Tie'
  end
end
