# frozen_string_literal: true

require_relative '../../lib/tic_tac_toe/game_config/game_interface'
require 'stringio'

RSpec.describe TicTacToe::GameInterface do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\n") }
  let(:first_player) { double('Human', name: 'David') }
  let(:second_player) { double('Random Computer', name: 'Random Computer') }
  before do
    TicTacToe::GameInterface.output = output
    TicTacToe::GameInterface.input = input
  end

  it 'displays languages to the output stream and return user choice' do
    expect(subject.display_language_options).to eq(1)
    expect(output.string).to include("#{I18n.t('choose_language_msg')}\n#{I18n.t('languages.1')}\n#{I18n.t('languages.2')}")
  end

  it 'displays instructions to the output stream' do
    subject.display_instructions
    expect(output.string).to include("\t\t\t#{I18n.t('welcome_message')}\n\n\n\n\t#{I18n.t('instructions.header')}")
  end

  it 'displays given error message to the output stream' do
    message = 'nil is not a valid locale'
    subject.display_error_message(message)
    expect(output.string).to include(message)
  end

  it 'displays different game modes a user can pick from and return user mode choice' do
    expect(subject.choose_mode).to eq(1)
    expect(output.string).to include("\t\t#{I18n.t('game_mode.header')}\n\t\t~~~~~~~~~~\n\n#{I18n.t('game_mode.body')}")
  end

  it 'prompts user to choose who plays first' do
    expect(subject.choose_who_plays_first(first_player, second_player)).to eq(1)
  end

  it 'prompts for board size' do
    TicTacToe::GameInterface.input = StringIO.new("3\n")
    expect(subject.prompt_board_size).to eq(3)
  end
end
