require_relative 'express_board_in_rows'
module TicTacToe
  class Board
    include BoardAsRows
    DENOTE_EMPTY = '-'.freeze
    attr_accessor :board, :board_size

    def initialize(size)
      @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
      @board_size = size
    end

    def apply_move(symbol, move)
      position = blank_positions[move]
      board[position[:row]][position[:col]] = symbol
      blank_positions.delete(blank_positions.key(position))
    end

    def blank_positions
      size = board.size
      hash = {}
      index = 1
      (0...size).each do |row|
        (0...size).each do |col|
          hash[index] = { row: row, col: col } if board[row][col] == DENOTE_EMPTY
          index += 1
        end
      end
      hash
    end

    def number_of_played_positions
      board_size * board_size - blank_positions.length
    end

    def board_state(player_symbol)
      return nil if more_than_minimun_plays_to_win?(board_size)

      check_rows = express_board_as_rows(board)

      if check_rows.any? { |row| win?(row, player_symbol) }
        'Winner'
      elsif number_of_played_positions == board_size * board_size
        'Tie'
      end
    end

    def reset_move(move)
      board[move[:row]][move[:col]] = DENOTE_EMPTY
    end

    def reset_board
      (0...board_size).each do |row|
        (0...board_size).each do |col|
          board[row][col] = DENOTE_EMPTY
        end
      end
    end

    private

    def win?(row, player_symbol)
      row.uniq.count == 1 && row[0] == player_symbol
    end

    def more_than_minimun_plays_to_win?(board_size)
      minimun_plays_to_win = board_size * 2 - 1
      number_of_played_positions < minimun_plays_to_win
    end
  end
end
