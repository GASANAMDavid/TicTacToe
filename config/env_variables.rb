require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob("#{File.dirname(__FILE__)}/../config/locales/**.yml")
I18n.load_path += path

I18n.default_locale = 'fr'

content = {
    playerName: I18n.t('player_name'),
    boardSize_msg: I18n.t('prompt_board_size'), 
    game_mode: I18n.t('game_mode.header'),
    symbol: I18n.t('symbol'),
    select: I18n.t('select'),
    reset: I18n.t('reset'),
    newGame: I18n.t('new_game')


 }

puts(content)