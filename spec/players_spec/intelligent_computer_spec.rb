require_relative '../../lib/players/intelligent_computer'
require_relative '../../lib/board'

RSpec.describe IntelligentComputer do
  describe '#make_move' do
    context 'starting from leaf nodes one play away from finishing the game' do
      let(:subject) { IntelligentComputer.new('Intelligent Computer', 'O') }
      let(:playing_board) { Board.new(3) }
      before do
        [
          [[1, 3, 5, 8], 'X'],
          [[4, 2, 6, 7], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end

      it 'returns 1 ' do
        expect(subject.make_move(playing_board)).to eq 1
      end
    end
  end
end
