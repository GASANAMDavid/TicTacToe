# frozen_string_literal: true

module TicTacToe
  module BoardAsRows
    def express_board_as_rows(board)
      all_as_rows = []
      board.each do |row|
        all_as_rows << row
      end

      board.transpose.each do |col|
        all_as_rows << col
      end

      all_as_rows << (0...board.size).collect do |item|
        board[item][item]
      end

      all_as_rows << (0...board.size).collect do |item|
        board[item][board.size - (item + 1)]
      end
    end
  end
end
