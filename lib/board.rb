require_relative 'express_board_in_rows'

class Board
  include BoardAsRows
  DENOTE_EMPTY = '-'
  attr_reader :board, :num_of_played_positions, :blank_positions

  def initialize(size)
    @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
    @num_of_played_positions = 0
    @blank_positions = make_blank_positions_hash(size.times.to_a.product(size.times.to_a))
  end

  def apply_move(symbol, position)
    board[position[:row]][position[:col]] = symbol
    @num_of_played_positions += 1
    blank_positions.delete(blank_positions.key(position))
  end

  def make_blank_positions_hash(blanks)
    hash = {}
    (0...blanks.length).each do |i|
      hash[i + 1] = { row: blanks[i][0], col: blanks[i][1] }
    end
    hash
  end

  def board_state(symbol)
    board_size = board.size
    return nil if more_than_minimun_plays_to_win?(board_size)

    check_rows = express_board_as_rows(board)

    if check_rows.any? { |row| win?(row, symbol) }
      'Winner'
    elsif num_of_played_positions == board_size * board_size
      'Tie'
    end
  end

  private

  def win?(row, mark)
    row.uniq.count == 1 && row[0] == mark
  end

  def more_than_minimun_plays_to_win?(board_size)
    minimun_plays_to_win = board_size * 2 - 1
    num_of_played_positions < minimun_plays_to_win
  end
end
