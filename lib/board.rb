require_relative 'express_board_in_rows'

class Board
  include BoardAsRows
  DENOTE_EMPTY = '-'
  attr_reader :board, :num_of_played_positions

  def initialize(size)
    @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
    @num_of_played_positions = 0
    @blank_positions = make_blank_positions_hash(size.times.to_a.product(size.times.to_a))
  end

  def apply_move(symbol, move)
    position = blank_positions[move]
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

  def board_state(player_symbol)
    board_size = board.size
    return nil if more_than_minimun_plays_to_win?(board_size)

    check_rows = express_board_as_rows(board)

    if check_rows.any? { |row| win?(row, player_symbol) }
      'Winner'
    elsif (num_of_played_positions == board_size * board_size) && blank_positions.empty?
      'Tie'
    end
  end

  def reset_move(move)
    board[move[:row]][move[:col]] = DENOTE_EMPTY
  end

  private

  def win?(row, player_symbol)
    row.uniq.count == 1 && row[0] == player_symbol
  end

  def more_than_minimun_plays_to_win?(board_size)
    minimun_plays_to_win = board_size * 2 - 1
    num_of_played_positions < minimun_plays_to_win
  end
end
