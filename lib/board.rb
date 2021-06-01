class Board
  DENOTE_EMPTY = '-'
  attr_reader :board, :num_of_blank_spaces, :blank_positions

  def initialize(size)
    @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
    @num_of_blank_spaces = size * size
    @blank_positions = make_free_positions_hash(size.times.to_a.product(size.times.to_a))
  end

  def apply_move(symbol, position)
    board[position[:row]][position[:col]] = symbol
    @num_of_blank_spaces -= 1
    blank_positions.delete(blank_positions.key(position))
  end

  def make_free_positions_hash(blanks)
    hash = {}
    (0...blanks.length).each do |i|
      hash[i + 1] = { row: blanks[i][0], col: blanks[i][1] }
    end
    hash
  end
end
