require_relative 'game_interface'
module SetLanguages
  def self.change_language
    languages = %w[en fr]
    choice = GameInterface.display_language_options
    begin
      I18n.default_locale = languages[choice]
    rescue StandardError => e
      GameInterface.display_error_message(e.message)
    end
  end
end
