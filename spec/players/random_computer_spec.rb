# frozen_string_literal: true

require_relative '../../lib/tic_tac_toe/players/random_computer'

RSpec.describe TicTacToe::RandomComputer do
  let(:playing_board) { double }
  let(:subject) { TicTacToe::RandomComputer.new('Random Computer', 'O') }

  context '#make_move' do
    it 'makes and returns a random move from available blank positions' do
      allow(playing_board).to receive(:blank_positions).and_return({ 1 => { row: 0, col: 1 }, 7 => { row: 1, col: 2 } })
      expect([1, 7].include?(subject.make_move(playing_board))).to eq(true)
    end
  end
end
