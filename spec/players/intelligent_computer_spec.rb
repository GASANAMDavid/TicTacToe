# frozen_string_literal: true

require_relative '../../lib/tic_tac_toe/players/intelligent_computer'
require_relative '../../lib/tic_tac_toe/board'

OPPONENT_PLAYER_SYMBOL = 'X'

RSpec.describe TicTacToe::IntelligentComputer do
  describe '#make_move' do
    let(:subject) { TicTacToe::IntelligentComputer.new('Intelligent Computer', 'O') }
    let(:playing_board) { TicTacToe::Board.new(3) }
    context 'starting from leaf nodes with one play away from finishing the game' do
      before do
        [
          [[1, 3, 5, 8], OPPONENT_PLAYER_SYMBOL],
          [[4, 2, 6, 7], subject.symbol]
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end

      it 'returns position key 9 from available positions ' do
        expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 9
      end
    end
    context 'starting from leaf nodes with one play away from finishing the game' do
      before do
        [
          [[1, 3, 4, 9], OPPONENT_PLAYER_SYMBOL],
          [[2, 5, 6], subject.symbol]
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end

      it 'returns 8' do
        expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 8
      end
    end
    context 'two moves away from winning' do
      before do
        [
          [[1, 3, 7], OPPONENT_PLAYER_SYMBOL],
          [[2, 4], subject.symbol]
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end
      it 'should return 5 ' do
        expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 5
      end
    end
    context 'one moves away from winning' do
      before do
        [
          [[1, 3, 8, 6], OPPONENT_PLAYER_SYMBOL],
          [[2, 5, 7], subject.symbol]
        ].each do |moves, symbol|
          moves.each do |move|
            playing_board.apply_move(symbol, move)
          end
        end
      end
      it 'should return 6 ' do
        expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 9
      end
    end

    context 'after first players move is at the board vertice or corner' do
      [[1, OPPONENT_PLAYER_SYMBOL],
       [3, OPPONENT_PLAYER_SYMBOL],
       [7, OPPONENT_PLAYER_SYMBOL],
       [9, OPPONENT_PLAYER_SYMBOL]].each do |move, symbol|
        it 'returns 5 as intelligent computers best move' do
          playing_board.apply_move(symbol, move)
          expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 5
        end
      end
    end
    context 'after first players move is at the center of the board' do
      it 'returns move that is at corner of the board as intelligent computers best move' do
        playing_board.apply_move(OPPONENT_PLAYER_SYMBOL, 5)
        expect(subject.make_move(playing_board, OPPONENT_PLAYER_SYMBOL)).to eq 1
      end
    end
  end
end
