require_relative '../lib/human_player'
require 'stringio'

RSpec.describe HumanPlayer do
  let(:output) { StringIO.new }
  let(:board) { Board.new(3) }
  let(:human_player) { HumanPlayer.new('Mason', 'Z', board) }
  it 'allows human player to see current board' do
    human_player.see_board(output)
    expect(output.string).to include("[\"-\", \"-\", \"-\"]\n[\"-\", \"-\", \"-\"]\n[\"-\", \"-\", \"-\"]\n")
  end
end
