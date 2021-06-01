require_relative 'express_board_in_rows'

class Board
  include BoardAsRows
  DENOTE_EMPTY = '-'
  attr_reader :board, :num_of_played_positions, :blank_positions

  def initialize(size)
    @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
    @num_of_played_positions = 0
    @blank_positions = make_free_positions_hash(size.times.to_a.product(size.times.to_a))
  end

  def apply_move(symbol, position)
    board[position[:row]][position[:col]] = symbol
    @num_of_played_positions += 1
    blank_positions.delete(blank_positions.key(position))
  end

  def make_free_positions_hash(blanks)
    hash = {}
    (0...blanks.length).each do |i|
      hash[i + 1] = { row: blanks[i][0], col: blanks[i][1] }
    end
    hash
  end

  def board_state(symbol)
    return nil if num_of_played_positions < board.size * 2 - 1

    check_rows = express_board_as_rows(board)

    if check_rows.any? { |row| check_uniqueness(row, symbol) }
      'Winner'
    elsif num_of_played_positions == board_size * board_size
      'Tie'
    end
  end

  private

  def check_uniqueness(row, mark)
    row.uniq.count == 1 && row[0] == mark
  end
end
