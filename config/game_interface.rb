require_relative './env_variables'
module GameInterface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin

  def self.display_language_options
    output.puts I18n.t('choose_language_msg')
    output.puts I18n.t('languages')
    input.gets.chomp.to_i
  end

  def self.display_instructions
    output.puts I18n.t('welcome_message')
    output.puts I18n.t('instructions.header')
    output.puts I18n.t('instructions.body')
    output.puts I18n.t('instructions.ending_line')
  end

  def self.display_error_message(message)
    output.puts message
  end

  def self.choose_mode
    output.puts I18n.t('game_mode.header')
    output.puts I18n.t('game_mode.body')
    output.puts I18n.t('game_mode.choose_msg')
    input.gets.chomp.to_i
  end

  def self.choose_who_plays_first(first_player, second_player)
    output.puts I18n.t('choose_first_player.msg')
    output.puts I18n.t('choose_first_player.one', name: first_player.name)
    output.puts I18n.t('choose_first_player.two', name: second_player.name)
    input.gets.chomp.to_i
  end

  def self.prompt_board_size
    output.puts I18n.t('prompt_board_size')
    input.gets.chomp.to_i
  end

  def self.human_player_info(order)
    output.puts I18n.t('human_player_info.name', order: order)
    name = input.gets.chomp
    output.puts I18n.t('human_player_info.symbol', order: order)
    symbol = input.gets.chomp
    { name: name, symbol: symbol }
  end

  def self.random_computer_info
    { name: I18n.t('random_computer.name'), symbol: I18n.t('random_computer.symbol') }
  end

  def self.intelligent_computer_info
    { name: I18n.t('intelligent_computer.name'), symbol: I18n.t('intelligent_computer.symbol') }
  end
end
