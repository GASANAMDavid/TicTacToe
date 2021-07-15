# frozen_string_literal: true

require_relative './game_config/game_interface'
require_relative './board'
require_relative './game_status'
require_relative './opponent_type'
require_relative './validation'
require_relative './game_config/set_languages'

module TicTacToe
  class WebEngine
    attr_reader :board, :opponent_player

    def initialize(board, current_player_name, game_mode)
      @board = board
      @game_board = TicTacToe::Board.new(board.size)
      @game_board.board = board
      @opponent_player = TicTacToe::OpponentType.when_game_mode_is(game_mode)
      @current_player_name = current_player_name
    end

    def play(symbol, move)
      TicTacToe::Validation.validate_move(@game_board, move)
      @game_board.apply_move(symbol, move)
      opponent_player_move if @game_board.board_state(symbol).nil?
      @board = @game_board.board
    end

    def check_status(symbol)
      result = TicTacToe::GameStatus.find(@current_player_name, symbol, @game_board)
      result = TicTacToe::GameStatus.find(@opponent_player.name, @opponent_player.symbol, @game_board) if result.nil?

      if result.nil?
        I18n.t('game_status.ongoing')
      else
        result
      end
    end

    private

    def opponent_player_move
      move = @opponent_player.make_move(@game_board)
      @game_board.apply_move(@opponent_player.symbol, move)
    end
  end
end
