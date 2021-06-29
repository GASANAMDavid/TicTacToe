require_relative '../../lib/tic_tac_toe/game_config/game_interface'
require 'stringio'

RSpec.describe TicTacToe::GameInterface do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  before do
    TicTacToe::GameInterface.output = output
    TicTacToe::GameInterface.input = input
  end

  it 'displays languages to the output stream and return user choice' do
    expect(subject.display_language_options).to eq(1)
    expect(output.string).to include("#{I18n.t('choose_language_msg')}#{I18n.t('languages')}")
  end

  it 'displays instructions to the output stream' do
    subject.display_instructions
    expect(output.string).to include("#{I18n.t('welcome_message')}#{I18n.t('instructions.header')}")
  end

  it 'displays given error message to the output stream' do
    message = 'nil is not a valid locale'
    subject.display_error_message(message)
    expect(output.string).to include(message)
  end

  it 'displays different game modes a user can pick from and return user mode choice' do
    expect(subject.choose_mode).to eq(1)
    expect(output.string).to include("#{I18n.t('game_mode.header')}#{I18n.t('game_mode.body')}")
  end
end
