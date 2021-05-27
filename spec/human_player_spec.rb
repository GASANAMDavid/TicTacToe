require_relative '../lib/human_player'
require 'stringio'

RSpec.describe HumanPlayer do
  let(:output) { StringIO.new }
  let(:human_player) { HumanPlayer.new('Mason', 'Z') }
  it 'allows human player to see current board' do
    expect(human_player.name).to eq('Mason')
  end
end
