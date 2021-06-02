module Validation
  def validate_move(board, move)
    blank_spaces = board.blank_positions
    blank_spaces.key?(move)
  end
end
