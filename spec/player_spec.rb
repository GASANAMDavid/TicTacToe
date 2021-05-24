require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Player do
  let(:board) { Board.new(3) }
  let(:player) { Player.new('Bob', 'X', board) }
  it 'initializes a player with name and symbol and gives them a unique id' do
    expect(player.name).to eq('Bob')
    expect(player.id).to eq(2)
  end
end
