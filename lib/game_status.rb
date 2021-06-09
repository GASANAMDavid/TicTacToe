require_relative '../config/env_variables'
module GameStatus
  def self.find(current_player, playing_board)
    case playing_board.board_state(current_player.symbol)
    when 'Tie'
      I18n.t('game_status.draw')
    when 'Winner'
      I18n.t('game_status.win', name: current_player.name)
    end
  end
end
