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

    # X O X
    # X O O
    # - - X

    context 'starting from leaf nodes with one play away from finishing the game' do
      before do
        [
          [[1, 3, 4, 9], 'X'],
          [[2, 5, 6], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end

      it 'returns 8' do
        expect(subject.make_move(playing_board)).to eq 8
        puts playing_board.board.to_s
        puts playing_board.blank_positions
      end
    end

    # X O X
    # O - -
    # X - -
    context 'two moves away from winning' do
      before do
        [
          [[1, 3, 7], 'X'],
          [[2, 4], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end
      it 'returns 5 ' do
        expect(subject.make_move(playing_board)).to eq 5
      end
    end

    # XOX
    # -O-
    # OXX

    context 'two moves away from winning' do
      before do
        [
          [[1, 3, 8, 9], 'X'],
          [[2, 5, 7], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end
      it 'returns 5 ' do
        expect(subject.make_move(playing_board)).to eq 6
      end
    end
  end
end
