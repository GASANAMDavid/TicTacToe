# frozen_string_literal: true

require_relative './game_interface'
module TicTacToe
  class InvalidLocale < StandardError; end

  module SetLanguages
    def self.change_language(lang = 'en')
      I18n.default_locale = lang
    rescue StandardError => e
      raise TicTacToe::InvalidLocale, e.message
    end

    def self.language_translations(lang)
      change_language(lang)
      { welcomeMessage: I18n.t('welcome_message'),
        playerName: I18n.t('player_name'),
        promptSymbol: I18n.t('prompt_symbol'),
        gameMode: I18n.t('game_mode_label'),
        symbol: I18n.t('symbol'),
        select: I18n.t('select'),
        reset: I18n.t('reset'),
        newGame: I18n.t('new_game'),
        playGameHeader: I18n.t('play_game_header'),
        promptPlayerName: I18n.t('prompt_player_name'),
        boardSize: I18n.t('board_size'),
        editGame: I18n.t('edit_game'),
        finishedGame: I18n.t('finished_game'),
        invalidMove: I18n.t('invalid_move'),
        gameModes: [
          { value: 1, label: I18n.t('human_v_random') },
          { value: 2, label: I18n.t('human_v_intelligent') }
        ] }
    end
  end
end

p TicTacToe::SetLanguages.language_translations('fr')[:gameModes][1]
