# frozen_string_literal: true

require_relative './game_interface'
require_relative '../game_engine'
require_relative '../players/human'
require_relative '../players/random_computer'
require_relative '../players/intelligent_computer'
require_relative '../board'

module TicTacToe
  module GameSetUp
    def self.setup(choice)
      system('clear')
      case choice
      when 1
        first_player_info = GameInterface.human_player_info(I18n.t('first'))
        second_player_info = GameInterface.human_player_info(I18n.t('second'))
        first_player = Human.new(first_player_info[:name], first_player_info[:symbol])
        second_player = Human.new(second_player_info[:name], second_player_info[:symbol])
      when 2
        first_player_info = GameInterface.human_player_info(I18n.t('human'))
        second_player_info = GameInterface.random_computer_info
        first_player = Human.new(first_player_info[:name], first_player_info[:symbol])
        second_player = RandomComputer.new(second_player_info[:name], second_player_info[:symbol])
      when 3
        first_player_info = GameInterface.human_player_info('human')
        second_player_info = GameInterface.intelligent_computer_info
        first_player = Human.new(first_player_info[:name], first_player_info[:symbol])
        second_player = IntelligentComputer.new(second_player_info[:name], second_player_info[:symbol])
      end
      system('clear')
      choice = GameInterface.choose_who_plays_first(first_player, second_player)
      if choice == 1
        player_one = first_player
        player_two = second_player
      else
        player_one = second_player
        player_two = first_player
      end
      system('clear')
      size = GameInterface.prompt_board_size
      board = create_board(size)
      GameEngine.new(board, player_one, player_two)
    end

    def self.create_board(size)
      Board.new(size)
    end
  end
end
