require_relative '../../lib/tic_tac_toe/players/intelligent_computer'
require_relative '../../lib/tic_tac_toe/board'

RSpec.describe TicTacToe::IntelligentComputer do
  describe '#make_move' do
    let(:subject) { TicTacToe::IntelligentComputer.new('Intelligent Computer', 'O') }
    let(:playing_board) { TicTacToe::Board.new(3) }
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
      end
    end
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
      it 'should return 5 ' do
        expect(subject.make_move(playing_board)).to eq 5
      end
    end
    context 'one moves away from winning' do
      before do
        [
          [[1, 3, 8, 6], 'X'],
          [[2, 5, 7], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end
      it 'should return 6 ' do
        expect(subject.make_move(playing_board)).to eq 9
      end
    end

    context 'after first players move is at the board vertice or corner' do
      [[1, 'X'],
       [3, 'X'],
       [7, 'X'],
       [9, 'X']].each do |move, symbol|
        it 'returns 5 as intelligent computers best move' do
          playing_board.apply_move(symbol, move)
          expect(subject.make_move(playing_board)).to eq 5
        end
      end
    end
    context 'after first players move is at the center of the board' do
      it 'returns move that is at corner of the board as intelligent computers best move' do
        playing_board.apply_move('X', 5)
        expect(subject.make_move(playing_board)).to eq 1
      end
    end
  end
end
