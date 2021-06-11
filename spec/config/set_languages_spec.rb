require_relative '../../config/set_languages'
# require_relative '../config/game_interface'

RSpec.describe SetLanguages do
  context '.change_language' do
    it 'changes the language used in the game' do
      allow(GameInterface).to receive(:display_language_options).and_return(0)
      SetLanguages.change_language
      expect(I18n.default_locale).to eq :en
    end
  end
end
