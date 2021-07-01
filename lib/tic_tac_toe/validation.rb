module TicTacToe
  module Validation
    def self.validate_move(board, move)
      blank_spaces = board.blank_positions
      key = blank_spaces.key?(move)
      raise StandardError, 'Invalid move' unless key

      key
    end
  end
end
