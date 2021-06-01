module Validation
  def validate_move(board, move)
    free_spaces = board.free_spaces
    free_spaces.key?(move)
  end
end
