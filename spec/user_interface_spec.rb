require_relative '../lib/user_interface'
require 'stringio'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }
  it 'displays instructions to the users of the game' do
    subject.display_instructions(output)
    expect(output.string).to include("Instructions\n::::::::::::::::\n\n 1. Players choose a symbol to use throught the game.")
  end
end
