require_relative '../lib/human_player'
require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe HumanPlayer do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:subject) { HumanPlayer.new('Mason', 'Z') { include UserInterface } }
  let(:playing_board) { double }

  context '#make_move' do
    before do
      UserInterface.output = output
      UserInterface.input = input
    end

    it "receives and return player's move" do
      allow(UserInterface).to receive(:see_board).with([['-', '-', '-']])
      allow(UserInterface).to receive(:get_players_move).and_return(1)
      allow(playing_board).to receive(:free_spaces).and_return({})
      allow(playing_board).to receive(:board).and_return([['-', '-', '-']])
      expect(subject.make_move(playing_board)).to eq(1)
    end
  end
end
