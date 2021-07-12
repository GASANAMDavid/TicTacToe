# frozen_string_literal: true

module TicTacToe
  module GameStatus
    def self.find(name, symbol, playing_board)
      case playing_board.board_state(symbol)
      when 'Tie'
        I18n.t('game_status.draw')
      when 'Winner'
        I18n.t('game_status.win', name: name)
      end
    end
  end
end
