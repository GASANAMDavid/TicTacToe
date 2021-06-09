require_relative '../lib/board'
require 'stringio'

RSpec.describe Board do
  let(:output) { StringIO.new }
  let(:player_board) { Board.new(3) }
  it 'initializes the board with size' do
    expect(player_board.board).to eq([%w[- - -], %w[- - -], %w[- - -]])
  end

  it "adds the player's symbol to the board's specified index " do
    player_board.apply_move('X', 1)
    expect(player_board.board).to eq([%w[X - -], %w[- - -], %w[- - -]])
  end

  describe 'number of positions remaining and already played' do
    before do
      [
        [[1, 3, 8, 6], 'X'],
        [[2, 5, 7], 'O']
      ].each do |moves, symbol|
        moves.each do |move|
          player_board.apply_move(symbol, move)
        end
      end
    end
    context '#number_of_played_positions' do
      it 'returns 8' do
        expect(player_board.number_of_played_positions).to eq(7)
      end
    end
    context '#blank_positions' do
      it 'returns a hash of key/value pairs. Key represanting a blank position on a board' do
        expect(player_board.blank_positions).to eq({ 4 => { row: 1, col: 0 }, 9 => { row: 2, col: 2 } })
      end
    end
  end

  describe '#board_state' do
    context 'when the game is won' do
      [
        [[6, 5, 4, 1, 2], 'O',
         'ROW_WISE'],
        [[1, 4, 7, 6, 5], 'X',
         'COLUMN_WISE'],
        [[1, 5, 9, 6, 4], 'O',
         'MAIN_DIAGONAL_WISE'],
        [[3, 5, 7, 1, 9], 'X',
         'COUNTER_DIAGONAL_WISE']
      ].each do |moves, symbol, description|
        it "should return 'Winner' if player has won (#{description})" do
          moves.each do |move|
            player_board.apply_move(symbol, move)
          end

          expect(player_board.board_state(symbol)).to eq 'Winner'
        end
      end
    end

    context 'when the game should be tied' do
      before do
        [
          [[1, 3, 8, 6, 4], 'X'],
          [[2, 5, 7, 9], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            player_board.apply_move(symbol, move)
          end
        end
      end
      it 'should return tie ' do
        expect(player_board.board_state('X')).to eq('Tie')
      end
    end

    context 'unfinished game' do
      before do
        [
          [[1, 3, 6, 4], 'X'],
          [[2, 5, 7], 'O']
        ].each do |moves, symbol|
          moves.each do |move|
            player_board.apply_move(symbol, move)
          end
        end
      end
      it 'should return nil for unfinished game ' do
        expect(player_board.board_state('X')).to eq(nil)
      end
    end

    context '#reset_move' do
      let(:valid_move) { { 1 => { row: 0, col: 0 } } }
      it 'resets a previously played position to empty' do
        player_board.apply_move('X', valid_move.keys[0])
        player_board.reset_move(valid_move.values[0])
        expect(player_board.board[0][0]).to eq('-')
      end
    end
  end
end
