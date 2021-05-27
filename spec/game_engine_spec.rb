require_relative '../lib/game_engine'

RSpec.describe GameEngine do
  let(:board) { double('board') }
  let(:player1) { double('player') }
  let(:player2) { double('player') }
  let(:subject) { GameEngine.new(board, player1, player2) }
  context '#play' do
    it 'returns Tie if the state of the game is TIED ' do
      allow(board).to receive(:game_state).with(no_args).and_return('Tie')
      allow(player1).to receive(:make_move)
      allow(player1).to receive(:name).and_return('Bob')
      expect(subject.play).to eq("It's a Draw")
    end

    it 'returns current player as winner if the state of the game is Winner ' do
      allow(board).to receive(:game_state).with(no_args).and_return('Winner')
      allow(player1).to receive(:make_move)
      allow(player1).to receive(:name).and_return('Mason').with(no_args).at_least(3).times
      expect(subject.play).to eq('Mason won the game')
    end
  end

  context '#switch_payers' do
    it 'receives current_player and switches to another player' do
      expect(subject.switch_players(player1)).to eq(player2)
    end
  end
end
