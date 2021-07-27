# frozen_string_literal: true

require_relative '../lib/tic_tac_toe/user_interface'
require 'stringio'

RSpec.describe TicTacToe::UserInterface do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:board) { [[1, 2, 3]] }

  before do
    TicTacToe::UserInterface.output = output
    TicTacToe::UserInterface.input = input
  end

  it 'prints the board the output stream' do
    TicTacToe::UserInterface.see_board(board)
    expect(output.string).to eq("[1, 2, 3]\n")
  end

  it 'prompts human player for a move' do
    expect(TicTacToe::UserInterface.prompt_player_for_move).to eq(1)
    expect(output.string).to include('Enter your choice')
  end

  it 'displays player who is next to play ' do
    player = double('Player', name: 'Manzi', symbol: 'X')
    TicTacToe::UserInterface.display_which_player_turn(player)
    expect(output.string).to eq("Manzi's turn\n")
  end

  it 'displays info about game outcome to output stream' do
    TicTacToe::UserInterface.display_game_outcome('David won the game.')
    expect(output.string).to eq("David won the game.\n")
  end
end
