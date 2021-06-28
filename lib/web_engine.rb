require_relative 'game_config/game_interface'
require_relative 'board'
module TicTacToe
  class WebEngine
    attr_reader :board

    def initialize(board, opponent_player)
      @board = board
      @game_board = TicTacToe::Board.new(board.size)
      @game_board.board = board
      @opponent_player = opponent_player
    end

    def play(symbol, move)
      @game_board.apply_move(symbol, move)

      opponent_player_move if @game_board.board_state(symbol).nil?
      @board = @game_board.board
    end

    def check_status(symbol)
      @game_board.board_state(symbol)
    end

    private

    def opponent_player_move
      move = @opponent_player.make_move(@game_board)
      @game_board.apply_move(@opponent_player.symbol, move)
    end
  end
end
