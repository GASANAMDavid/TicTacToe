require_relative '../lib/board'
require 'stringio'

RSpec.describe Board do
  let(:output) { StringIO.new }
  let(:player_board) { Board.new(3) }
  it 'initializes the board with size' do
    expect(player_board.board).to eq([%w[- - -], %w[- - -], %w[- - -]])
  end

  it "adds the player's symbol to the board's specified index " do
    player_board.apply_move('X', { row: 0, col: 0 })
    expect(player_board.board).to eq([%w[X - -], %w[- - -], %w[- - -]])
  end
  describe '#board_state' do
    context 'when the game is won' do
      [
        [[{ row: 1, col: 2 }, { row: 1, col: 1 }, { row: 1, col: 0 }, { row: 0, col: 0 }, { row: 0, col: 1 }], 'O',
         'ROW_WISE'],
        [[{ row: 0, col: 0 }, { row: 1, col: 0 }, { row: 2, col: 0 }, { row: 1, col: 2 }, { row: 1, col: 1 }], 'X',
         'COLUMN_WISE'],
        [[{ row: 0, col: 0 }, { row: 1, col: 1 }, { row: 2, col: 2 }, { row: 1, col: 2 }, { row: 1, col: 0 }], 'O',
         'MAIN_DIAGONAL_WISE'],
        [[{ row: 0, col: 2 }, { row: 1, col: 1 }, { row: 2, col: 0 }, { row: 0, col: 0 }, { row: 2, col: 2 }], 'X',
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
        [[{ row: 0, col: 0 }, { row: 1, col: 2 }, { row: 1, col: 0 }, { row: 0, col: 2 }, { row: 2, col: 1 }], 'X',
         [{ row: 1, col: 1 }, { row: 0, col: 1 }, { row: 2, col: 0 }, { row: 2, col: 2 }], 'O']
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
        [[{ row: 0, col: 0 }, { row: 1, col: 2 }, { row: 1, col: 0 }, { row: 0, col: 2 }], 'X',
         [{ row: 1, col: 1 }, { row: 0, col: 1 }, { row: 2, col: 0 }], 'O']
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
  end
end
