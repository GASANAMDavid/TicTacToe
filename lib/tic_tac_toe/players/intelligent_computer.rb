# frozen_string_literal: true

require_relative 'player'

module TicTacToe
  class IntelligentComputer < Player
    def make_move(playing_board, opponent_player_symbol)
      best_move = -1
      best_score = -100
      alpha = -Float::INFINITY
      beta = Float::INFINITY

      available_positions = playing_board.blank_positions.clone
      available_positions.each do |key, move|
        playing_board.apply_move(symbol, key)
        static_evaluation_score = minimax(playing_board, false, alpha, beta, opponent_player_symbol)
        playing_board.reset_move(move)
        if static_evaluation_score > best_score
          best_move = key
          best_score = static_evaluation_score
        end
      end

      best_move
    end

    def minimax(current_board, is_maxmizing, alpha, beta, opponent_player_symbol)
      score = compute_score(current_board, opponent_player_symbol)
      return score if score

      scores = []
      available_positions = current_board.blank_positions.clone
      player_symbol = is_maxmizing ? symbol : opponent_player_symbol
      available_positions.each do |key, move|
        current_board.apply_move(player_symbol, key)
        score = minimax(current_board, !is_maxmizing, alpha, beta, opponent_player_symbol)
        current_board.reset_move(move)
        if score
          if is_maxmizing
            alpha = [score, alpha].max
          else
            beta = [score, beta].min
          end
          scores << score
        end
        break if beta <= alpha
      end
      is_maxmizing ? scores.max : scores.min
    end

    def compute_score(current_board, opponent_player_symbol)
      return +1 if current_board.board_state(symbol) == ('Winner')
      return -1 if current_board.board_state(opponent_player_symbol) == ('Winner')
      return 0 if current_board.board_state(symbol) == 'Tie'
    end
  end
end
