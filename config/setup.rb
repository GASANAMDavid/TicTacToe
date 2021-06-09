require_relative 'interface'
require_relative '../lib/game_engine'
require 'i18n'
module GameSetUp
  def self.setup(choice)
    board = Interface.make_board
    case choice
    when 1
      first_player = Interface.human_player_info(I18n.t('first'))
      second_player = Interface.human_player_info(I18n.t('second'))
      GameEngine.new(board, first_player, second_player)
    when 2
      human_player = Interface.human_player_info(I18n.t('human'))
      random_computer_player = Interface.random_computer_info
      GameEngine.new(board, human_player, random_computer_player)
    end
  end
end
