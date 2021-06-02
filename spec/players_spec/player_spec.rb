require_relative '../../lib/players/player'

RSpec.describe Player do
  let(:player) { Player.new('Bob', 'X') }
  it 'initializes a player with name and symbol' do
    expect(player.name).to eq('Bob')
    expect(player.symbol).to eq('X')
  end
end
