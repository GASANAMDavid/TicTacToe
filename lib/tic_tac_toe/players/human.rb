# frozen_string_literal: true

require_relative 'player'
require_relative '../user_interface'
require_relative '../validation'

module TicTacToe
  class Human < Player
    def make_move(playing_board)
      TicTacToe::UserInterface.see_board(playing_board.board)
      move = TicTacToe::UserInterface.prompt_player_for_move
      move if TicTacToe::Validation.validate_move(playing_board, move)
    end
  end
end
