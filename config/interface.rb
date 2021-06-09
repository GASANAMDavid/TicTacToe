require_relative '../lib/players/human'
require_relative '../lib/players/random_computer'
require_relative '../lib/board'
require_relative 'env_variables'
module Interface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin
  def self.display_instructions
    system('clear')
    output.puts I18n.t('welcome_message')
    output.puts I18n.t('instructions.header')
    output.puts I18n.t('instructions.one')
    output.puts I18n.t('instructions.two')
    output.puts I18n.t('instructions.three')
    output.puts I18n.t('instructions.four')
    output.puts I18n.t('instructions.five')
    output.puts I18n.t('instructions.ending_line')
  end

  def self.choose_mode
    output.puts I18n.t('game_mode.header')
    output.puts I18n.t('game_mode.one')
    output.puts I18n.t('game_mode.two')
    output.puts I18n.t('game_mode.three')
    output.puts I18n.t('game_mode.four')

    output.puts I18n.t('game_mode.choose_msg')
    input.gets.chomp.to_i
  end

  def self.make_board
    output.puts I18n.t('prompt_board_size')
    size = input.gets.chomp.to_i
    Board.new(size)
  end

  def self.human_player_info(order)
    output.puts I18n.t('human_player_info.name', order: order)
    name = input.gets.chomp
    output.puts I18n.t('human_player_info.symbol', order: order)
    symbol = input.gets.chomp
    Human.new(name, symbol)
  end

  def self.random_computer_info
    RandomComputer.new(I18n.t('random_computer.name'), I18n.t('random_computer.symbol'))
  end
end
