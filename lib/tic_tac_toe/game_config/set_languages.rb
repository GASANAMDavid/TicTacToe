# frozen_string_literal: true

require_relative './game_interface'
module TicTacToe
  module SetLanguages
    def self.change_language(lang = 'en')
      I18n.default_locale = lang
    rescue StandardError => e
      GameInterface.display_error_message(e.message)
    end
  end
end
