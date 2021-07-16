# frozen_string_literal: true

require_relative 'player'
module TicTacToe
  class RandomComputer < Player
    def make_move(playing_board, _opponent_player_symbol = '')
      playing_board.blank_positions.keys.sample
    end
  end
end
