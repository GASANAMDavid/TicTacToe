# frozen_string_literal: true

require_relative './game_config/game_interface'
require_relative './players/random_computer'
require_relative 'players/intelligent_computer'
module TicTacToe
  module OpponentType
    def self.when_game_mode_is(game_mode)
      if game_mode == 1
        opponent_info = TicTacToe::GameInterface.random_computer_info
        TicTacToe::RandomComputer.new(opponent_info[:name], opponent_info[:symbol])
      else
        opponent_info = TicTacToe::GameInterface.intelligent_computer_info
        TicTacToe::IntelligentComputer.new(opponent_info[:name], opponent_info[:symbol])
      end
    end
  end
end
