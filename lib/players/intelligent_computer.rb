require_relative 'player'

class IntelligentComputer < Player
  def make_move(playing_board)
    # depth = playing_board.board.size
    minimax(playing_board, 1, 'O')
  end

  def minimax(current_board, depth, symbol)
    return compute_score(current_board, symbol) if depth.zero?

    scores = []
    moves = []
    available_positions = current_board.blank_positions
    available_positions.each do |key, _indices|
      current_board.apply_move(symbol, key)
      score = minimax(current_board, depth - 1, 'X')
      scores << score unless score.nil?
      moves << key
    end

    puts current_board.blank_positions
    maximum_score_index = scores.each_with_index.max[1]
    moves[maximum_score_index]
  end

  def compute_score(current_board, symbol)
    return +1 if current_board.board_state(symbol) == 'Winner'
    return -1 if current_board.board_state(symbol) == 'Winner'
    return 0 if current_board.board_state(symbol) == 'Tie'
    return 0 if current_board.board_state(symbol) == 'Tie'
  end
end
