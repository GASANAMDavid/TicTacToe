class Board
  DENOTE_EMPTY = '-'
  attr_reader :board, :num_of_blank_spaces, :blank_positions

  def initialize(size)
    @board = Array.new(size) { Array.new(size) { DENOTE_EMPTY } }
    @num_of_blank_spaces = size * size
    @blank_positions = make_free_positions_hash(size.times.to_a.product(size.times.to_a))
  end

  def print_board(output = $stdout)
    board.each do |i|
      output.puts i.to_s
    end
  end

  def apply_move(symbol, position)
    board[position[0]][position[1]] = symbol
    @num_of_blank_spaces -= 1
    blank_positions.delete(blank_positions.key(position))
  end

  def make_free_positions_hash(blanks)
    hash = {}
    (0...blanks.length).each do |i|
      hash[i + 1] = blanks[i]
    end
    hash
  end
end
