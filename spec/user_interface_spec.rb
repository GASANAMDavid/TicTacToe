require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:board) { [[1, 2, 3]] }

  before do
    UserInterface.output = output
    UserInterface.input = input
  end

  it 'prints the board the output stream' do
    UserInterface.see_board(board)
    expect(output.string).to eq("[1, 2, 3]\n")
  end

  it 'prompts human player for a move' do
    expect(UserInterface.prompt_player_for_move).to eq(1)
    expect(output.string).to include('Enter your choice')
  end

  it 'displays player whose next to play ' do
    player = double('Player', name: 'Manzi', symbol: 'X')
    UserInterface.display_which_player_turn(player)
    expect(output.string).to eq("Manzi's turn\n")
  end

  it 'displays info about game outcome to output stream' do
    UserInterface.display_game_outcome('David won the game.')
    expect(output.string).to eq("David won the game.\n")
  end
end
