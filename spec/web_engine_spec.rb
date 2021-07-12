require_relative '../lib/tic_tac_toe/web_engine'

RSpec.describe TicTacToe::WebEngine do
  let(:board) { [['X', '-', '-'], ['-', '-', '-'], ['-', '-', '-']] }
  let(:opponent_player) { double('RandomComputer', name: 'Random Computer', symbol: 'O', make_move: 9) }
  let(:game_mode) { 2 }
  let(:web_engine) { TicTacToe::WebEngine.new(board, 'David', game_mode) }
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
        web_engine.board[0][0] = '-'
        web_engine.play('X', 1)
        expect(web_engine.board[1][1]).to eq('O')
      end
    end

    context 'when the game is finished after current_players move' do
      it "doesn't allow opponent_player to make move" do
        web_engine.board[1][1] = 'O'
        web_engine.board[0][2] = 'O'
        web_engine.board[1][0] = 'X'
        web_engine.play('X', 7)
        expect(web_engine.board).to eq([['X', '-', 'O'], ['X', 'O', '-'], ['X', '-', '-']])
      end
    end
  end

  describe '#game_status' do
    it 'return ongoing if game is not finished' do
      expect(web_engine.check_status('X')).to eq('Ongoing')
    end
  end

  describe '.language_translation' do
    it('returns translations') do
      result = TicTacToe.language_translations('fr')
      expect(result[:playerName]).to eq('Nom de joueur')
    end
  end
  
end
