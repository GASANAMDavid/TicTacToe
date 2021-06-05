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

    context 'when the game is Tied' do
      [
        [[1, 6, 4, 3, 8], 'X',
         [5, 2, 7, 9], 'O']
      ].each do |first_player_moves, first_player_symbol, second_player_moves, second_player_symbol|
        it 'returns Tie' do
          first_player_moves.each do |move|
            player_board.apply_move(first_player_symbol, move)
          end
          second_player_moves.each do |move|
            player_board.apply_move(second_player_symbol, move)
          end
          expect(player_board.board_state(first_player_symbol)).to eq 'Tie'
        end
      end
    end

    context 'unfinished game' do
      [
        [[1, 6, 4, 3], 'X',
         [5, 2, 7], 'O']
      ].each do |first_player_moves, first_player_symbol, second_player_moves, second_player_symbol|
        it 'returns nil indicating that the game continues' do
          first_player_moves.each do |move|
            player_board.apply_move(first_player_symbol, move)
          end
          second_player_moves.each do |move|
            player_board.apply_move(second_player_symbol, move)
          end
          expect(player_board.board_state(first_player_symbol)).to eq nil
        end
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
