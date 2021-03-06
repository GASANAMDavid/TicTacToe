# frozen_string_literal: true

module TicTacToe
  class InvalidMove < StandardError; end

  module Validation
    def self.validate_move(board, move)
      blank_spaces = board.blank_positions
      key = blank_spaces.key?(move)
      raise InvalidMove, 'Invalid move' unless key

      key
    end
  end
end
