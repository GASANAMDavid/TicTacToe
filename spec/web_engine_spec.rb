require_relative '../lib/tic_tac_toe/web_engine'

RSpec.describe TicTacToe::WebEngine do
  let(:board) { [['X', '-', '-'], ['-', '-', '-'], ['-', '-', '-']] }
  let(:opponent_player) { double('RandomComputer', name: 'Random Computer', symbol: 'O', make_move: 9) }
  let(:web_engine) { TicTacToe::WebEngine.new(board, 'David', opponent_player) }
  it 'creates a board with assigned values' do
    expect(web_engine.board).to eq(board)
  end
  describe '#play' do
    it 'apply a move to the board' do
      web_engine.play('X', 2)
      board[0][1] = 'X'
      expect(web_engine.board).to eq(board)
    end

    context 'when the game is not finished after current_players move' do
      it 'allows opponent_player to make move' do
        web_engine.play('X', 2)
        allow(opponent_player).to receive(:make_move)
        expect(web_engine.board[2][2]).to eq('O')
      end
    end

    context 'when the game is finished after current_players move' do
      it "doesn't allow opponent_player to make move" do
        board[0][2]
        web_engine.play('X', 2)
        expect(opponent_player).not_to receive(:make_move)
      end
    end
  end

  describe '#game_status' do
    it 'return nil if game is not finished' do
      expect(web_engine.check_status('X')).to eq(nil)
    end
  end
end
