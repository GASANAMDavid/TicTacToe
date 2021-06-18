require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob('./config/locales/**.yml')
puts [path]
I18n.load_path << path
# puts I18n.load_path
# path2 = Dir["#{File.expand_path('config/locales')}/*.yml"]
# I18n.default_locale = 'fr'
# p I18n.default_locale
