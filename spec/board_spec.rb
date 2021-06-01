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
  end
end
