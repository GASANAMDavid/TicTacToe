require_relative '../../lib/players/human'
require_relative '../../lib/user_interface'
require 'stringio'

RSpec.describe TicTacToe::Human do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:subject) { TicTacToe::Human.new('Mason', 'Z') { include UserInterface } }
  let(:playing_board) { double }

  context '#make_move' do
    before do
      TicTacToe::UserInterface.output = output
      TicTacToe::UserInterface.input = input
    end

    it "return player's move" do
      allow(TicTacToe::UserInterface).to receive(:see_board).with([['-', '-', '-']])
      allow(TicTacToe::UserInterface).to receive(:prompt_player_for_move).and_return(1)
      allow(playing_board).to receive(:blank_positions).and_return({ 1 => { row: 0, col: 1 } })
      allow(playing_board).to receive(:board).and_return([['-', '-', '-']])
      expect(subject.make_move(playing_board)).to eq(1)
    end
  end
end
