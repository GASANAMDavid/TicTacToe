require_relative '../../config/set_languages'

RSpec.describe SetLanguages do
  context '.change_language' do
    it 'changes the language used in the game' do
      SetLanguages.change_language
      expect(I18n.default_locale).to eq :en
    end

    it 'sets language from argument list' do
      SetLanguages.change_language('en')
      expect(I18n.default_locale).to eq :en
    end
  end
end
