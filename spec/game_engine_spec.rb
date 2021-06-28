require_relative '../lib/game_engine'
require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe TicTacToe::GameEngine do
  let(:board) { double('board', board: [['-']]) }
  let(:player1) { double('player') }
  let(:player2) { double('player') }
  let(:output) { StringIO.new }
  let(:subject) { TicTacToe::GameEngine.new(board, player1, player2) { include TicTacToe::UserInterface } }

  context '#play' do
    before do
      TicTacToe::UserInterface.output = output
      allow(player1).to receive(:name).and_return("N'Golo").at_most(4).times
      allow(player1).to receive(:make_move).with(board).and_return(1, 4)
      allow(player1).to receive(:symbol).and_return('X').at_most(4).times
      allow(board).to receive(:apply_move).with('X', 1)
      allow(TicTacToe::UserInterface).to receive(:see_board)
    end

    it 'returns Tie if the state of the game is TIED ' do
      allow(board).to receive(:board_state).with('X').and_return('Tie')
      subject.play
      expect(output.string).to include("It's a Draw")
    end

    it 'returns current player as winner if the state of the game is Winner ' do
      allow(board).to receive(:board_state).with('X').and_return('Winner')
      subject.play
      expect(output.string).to include("N'Golo won the game")
    end
    context 'testing loop' do
      before do
        allow(board).to receive(:board_state).with('X').and_return(nil).at_most(3).times
        allow(player2).to receive(:name).and_return('Kante').at_most(4).times
        allow(player2).to receive(:make_move).with(board).and_return(2, 9)
        allow(player2).to receive(:symbol).and_return('O').at_most(4).times
        allow(board).to receive(:apply_move).with('O', 2)
      end
      context 'loop 2 times' do
        it 'allows players to take turns when the game is not finished' do
          allow(board).to receive(:board_state).with('O').and_return('Winner')
          subject.play
          expect(output.string).to include('Kante won the game')
        end
      end
      context 'loop 4 times' do
        it 'allows players to take turns when the game is not finished' do
          allow(board).to receive(:apply_move).with('X', 4)
          allow(board).to receive(:apply_move).with('O', 9)
          allow(board).to receive(:board_state).with('O').and_return(nil, 'Winner')
          subject.play
          expect(output.string).to include('Kante won the game')
        end
      end
    end
  end
end
