require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("Bob\nX\n") }
  it 'displays instructions to the users of the game' do
    subject.display_instructions(output)
    expect(output.string).to include("Instructions\n::::::::::::::::\n\n 1. Players choose a unique symbol to use as a mark throught the game.")
  end

  it 'allows users of the game to choose the symbols' do
    subject.player_info(output, input)
    expect(output.string).to include("Enter player's name.")
  end

  it 'returns input from the user as a' do
    expect(subject.player_info(output, input)).to eq({ name: 'Bob', symbol: 'X' })
  end
end
