require_relative 'interface'
require_relative '../lib/game_engine'
module GameSetUp
  def self.setup(choice)
    board = Interface.make_board
    case choice
    when 1
      first_player = Interface.human_player_info('First')
      second_player = Interface.human_player_info('Second')
      GameEngine.new(board, first_player, second_player)
    when 2
      human_player = Interface.human_player_info('human')
      random_computer_player = Interface.random_computer_info
      GameEngine.new(board, human_player, random_computer_player)
    when 3
      human_player = Interface.human_player_info('human')
      intelligent_computer_player = Interface.intelligent_computer_info
      GameEngine.new(board, human_player, intelligent_computer_player)
    end
  end
end
