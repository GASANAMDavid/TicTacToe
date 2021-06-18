require_relative './game_interface'
require_relative './set_languages'
module Config
  def self.test
    SetLanguages.change_language('fr')
    GameInterface.display_language_options
  end

  test
end
