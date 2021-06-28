require_relative 'board'
module TicTacToe
  class WebEngine
    attr_reader :board

    def initialize(board)
      @board = board
      @game_board = Board.new(board.size)
      @game_board.board = board
    end

    def play(symbol, move)
      @game_board.apply_move(symbol, move)
      @board = @game_board.board
    end

    def check_status(symbol)
      @game_board.board_state(symbol)
    end
  end
end
