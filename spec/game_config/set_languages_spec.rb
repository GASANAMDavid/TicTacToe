# frozen_string_literal: true

require_relative '../../lib/tic_tac_toe/game_config/set_languages'

RSpec.describe TicTacToe::SetLanguages do
  context '.change_language' do
    it 'changes the language used in the game' do
      TicTacToe::SetLanguages.change_language
      expect(I18n.default_locale).to eq :en
    end

    it 'sets language from argument list' do
      TicTacToe::SetLanguages.change_language('en')
      expect(I18n.default_locale).to eq :en
    end

    it 'raises Invalid locale if not translations for locale specified' do
      expect do
        TicTacToe::SetLanguages.change_language('hello')
      end.to raise_error(TicTacToe::InvalidLocale,
                         '"hello" is not a valid locale')
    end
  end

  describe '.language_translation' do
    it('returns translations') do
      result = TicTacToe::SetLanguages.language_translations('en')
      expect(result[:playerName]).to eq('Player name')
    end
  end
end
