require_relative '../lib/board'
require 'stringio'

RSpec.describe Board do
  let(:output) { StringIO.new }
  let(:player_board) { Board.new(3) }
  it 'initializes the board with size' do
    expect(player_board.board).to eq([%w[- - -], %w[- - -], %w[- - -]])
  end

  it 'expects number of blank spaces to be 9' do
    expect(player_board.num_of_blank_spaces).to eq 9
  end

  it 'creates a hash from array of arrays' do
    expect(player_board.make_free_positions_hash([[1, 2]])).to eq({ 1 => { row: 1, col: 2 } })
  end
  it 'prints the board' do
    player_board.print_board(output)
    expect(output.string).to include("[\"-\", \"-\", \"-\"]\n")
  end

  it "adds the player's symbol to the board's specified index " do
    player_board.apply_move('X', { row: 0, col: 0 })
    expect(player_board.board).to eq([%w[X - -], %w[- - -], %w[- - -]])
  end
end
