require_relative '../../lib/players/random_computer'

RSpec.describe RandomComputer do
  let(:playing_board) { double }
  let(:subject) { RandomComputer.new('Random Computer', 'O') }

  context '#make_move' do
    it 'makes and returns a random move from available blank positions' do
      allow(playing_board).to receive(:blank_positions).and_return({ 1 => { row: 0, col: 1 }, 7 => { row: 1, col: 2 } })
      expect(subject.make_move(playing_board)).to eq 1 or 7
    end
  end
end
