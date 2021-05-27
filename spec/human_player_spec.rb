require_relative '../lib/human_player'
require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe HumanPlayer do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:human_player) { HumanPlayer.new('Mason', 'Z') }
  let(:user_interface) { double }
  let(:playing_board) { double }

  context '#make_move' do
    it 'receives input from the user and apply the move to the board' do
      allow(user_interface).to receive(:see_board).with([['-', '-', '-']], output)
      allow(user_interface).to receive(:see_available_free_position).with({ 1 => { row: 0, col: 0 } }, output)
      allow(user_interface).to receive(:get_players_move).with(output, input).and_return(1)
      allow(playing_board).to receive(:board).and_return([['-', '-', '-']])
      allow(playing_board).to receive(:blank_positions).and_return({ 1 => { row: 0, col: 0 } })
      allow(playing_board).to receive(:apply_move).with('Z', { row: 0, col: 0 })
      human_player.make_move(playing_board)
    end
  end
end
