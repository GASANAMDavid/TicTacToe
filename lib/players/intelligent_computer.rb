require_relative 'player'

class IntelligentComputer < Player
  def make_move(playing_board)
    best_move = -1
    best_score = -1.0 / 0
    available_positions = playing_board.blank_positions.clone
    available_positions.each do |key, move|
      playing_board.apply_move('O', key)
      static_evaluation_score = minimax(playing_board, false)
      p static_evaluation_score
      playing_board.reset_move(move)
      if !static_evaluation_score.nil? && (static_evaluation_score > best_score)
        best_move = key
        best_score = static_evaluation_score
      end
    end

    best_move
  end

  def minimax(current_board, is_maxmizing, value = 1)
    score = compute_score(current_board)
    return score unless score.nil?

    scores = []
    moves = []
    available_positions = current_board.blank_positions.clone
    if is_maxmizing
      available_positions.each do |key, move|
        current_board.apply_move('O', key)
        score = minimax(current_board, false)
        current_board.reset_move(move)
        unless score.nil?
          scores << score
          moves << key
        end
      end
      return scores.max { |a, b| a <=> b } unless scores.empty?
    end

    unless is_maxmizing
      available_positions.each do |key, move|
        current_board.apply_move('X', key)
        score = minimax(current_board, true, value)
        current_board.reset_move(move)
        unless score.nil?
          scores << score
          moves << key
        end
      end
      scores.min { |a, b| a <=> b } unless scores.empty?
    end
  end

  def compute_score(current_board)
    return +1 if current_board.board_state('O') == ('Winner')
    return -1 if current_board.board_state('X') == ('Winner')
    return 0 if current_board.board_state('O') == 'Tie'
  end
end
