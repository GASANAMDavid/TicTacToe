require_relative '../../lib/players/intelligent_computer'
require_relative '../../lib/board'

RSpec.describe IntelligentComputer do
  describe '#make_move' do
    let(:subject) { IntelligentComputer.new('Intelligent Computer', 'O') }
    let(:playing_board) { Board.new(3) }
    context 'starting from leaf nodes with one play away from finishing the game' do
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

      it 'returns position key 9 from available positions ' do
        expect(subject.make_move(playing_board)).to eq 9
      end
    end
    context 'starting from leaf nodes with three plays away from finishing the game' do
      before do
        [
          [[1, 3, 5], 'X'],
          [[4, 2, 6], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end

      it 'returns 1 ' do
        expect(subject.make_move(playing_board)).to eq 7
        puts playing_board.board.to_s
        puts playing_board.blank_positions
      end
    end
  end
end
