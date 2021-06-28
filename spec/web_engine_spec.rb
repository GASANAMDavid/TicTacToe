require_relative '../lib/web_engine'

RSpec.describe TicTacToe::WebEngine do
  let(:board) { [['X', '-', '-'], ['-', '-', '-'], ['-', '-', '-']] }
  let(:web_engine) { TicTacToe::WebEngine.new(board) }
  it 'creates a board with assigned values' do
    expect(web_engine.board).to eq(board)
  end
  describe '#play' do
    it 'apply a move to the board' do
      web_engine.play('O', 2)
      board[0][1] = 'O'
      expect(web_engine.board).to eq(board)
    end
  end

  describe '#game_status' do
    it 'return ongoing if game is not finished' do
      expect(web_engine.check_status('X')).to eq(nil)
    end
  end
end
