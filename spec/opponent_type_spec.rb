require_relative '../lib/opponent_type'

RSpec.describe TicTacToe::OpponentType do
  describe '#make_opponent' do
    [[1, 'RandomComputer', TicTacToe::RandomComputer],
     [2, 'IntelligentComputer', TicTacToe::IntelligentComputer]].each do |mode, player, type|
      it "returns #{player} as opponent" do
        opponent_player = TicTacToe::OpponentType.when_game_mode_is(mode)
        expect(opponent_player).to be_a(type)
      end
    end
  end
end
