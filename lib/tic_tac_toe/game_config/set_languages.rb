# frozen_string_literal: true

require_relative './game_interface'
module TicTacToe
  class InvalidLocale < StandardError; end

  module SetLanguages
    def self.change_language(lang = 'en')
      I18n.default_locale = lang
    rescue StandardError => e
      raise TicTacToe::InvalidLocale, "No translations found for `#{lang}`"
    end

    def self.language_translations(lang)
      change_language(lang)
      { welcomeMessage: I18n.t('welcome_message'),
        playerName: I18n.t('player_name'),
        promptBoardSize: I18n.t('prompt_board_size'),
        gameMode: I18n.t('game_mode_label'),
        symbol: I18n.t('symbol'),
        select: I18n.t('select'),
        reset: I18n.t('reset'),
        newGame: I18n.t('new_game'),
        playGameHeader: I18n.t('play_game_header'),
        promptPlayerName: I18n.t('prompt_player_name') }
    end
  end
end
