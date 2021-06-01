require_relative '../lib/game_engine'
require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe GameEngine do
  let(:board) { double('board') }
  let(:player1) { double('player') }
  let(:player2) { double('player') }
  let(:output) { StringIO.new }
  let(:subject) { GameEngine.new(board, player1, player2) { include UserInterface } }

  context '#play' do
    before do
      UserInterface.output = output
      allow(player1).to receive(:name).and_return("N'Golo")
      allow(player1).to receive(:make_move).with(board).and_return(1)
      allow(player1).to receive(:symbol).and_return('X')
      allow(board).to receive(:apply_move).with('X', 1)
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
      it 'allows players to take turns when the game is not finished' do
        allow(board).to receive(:board_state).with('X').and_return(nil)
        allow(player2).to receive(:name).and_return('Kante')
        allow(player2).to receive(:make_move).with(board).and_return(2)
        allow(player2).to receive(:symbol).and_return('O')
        allow(board).to receive(:apply_move).with('O', 2)
        allow(board).to receive(:board_state).with('O').and_return('Winner')
        subject.play
        expect(output.string).to include('Kante won the game')
      end
    end
  end
end
