require 'i18n'
require 'dotenv'
Dotenv.load
# path = Dir.glob('./config/locales/**.yml')
# puts I18n.load_path
path = Dir["#{File.expand_path('config/locales')}/*.yml"]
I18n.load_path += path
# I18n.default_locale = ''
# p I18n.default_locale
# p I18n.available_locales
