require_relative 'player'

class RandomComputer < Player
  def make_move(playing_board)
    playing_board.blank_positions.keys.sample
  end
end
