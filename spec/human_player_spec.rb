require_relative '../lib/human_player'
require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe HumanPlayer do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:subject) { HumanPlayer.new('Mason', 'Z') { include UserInterface } }
  let(:playing_board) { double }

  context '#make_move' do
    it "receives and return player's move" do
      subject.output = output
      subject.input = input
      allow(UserInterface).to receive(:see_board).with([['-', '-', '-']], output)
      allow(UserInterface).to receive(:get_players_move).with(output, input).and_return(1)
      allow(playing_board).to receive(:free_spaces).and_return({})
      allow(playing_board).to receive(:board).and_return([['-', '-', '-']])
      subject.make_move(playing_board)
    end
  end
end
