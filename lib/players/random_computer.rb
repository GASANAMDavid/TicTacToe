require_relative 'player'

class RandomComputer < Player
  def make_move(playing_board)
    blank_positions = playing_board.blank_positions.keys
    blank_positions[rand(blank_positions.length)]
  end
end
