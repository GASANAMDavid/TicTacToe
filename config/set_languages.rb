require_relative 'interface'
module SetLanguages
  def self.change_language
    languages = %w[en fr]
    choice = Interface.display_language_options
    begin
      I18n.default_locale = languages[choice]
    rescue StandardError => e
      Interface.display_error_message(e.message)
    end
  end
end
