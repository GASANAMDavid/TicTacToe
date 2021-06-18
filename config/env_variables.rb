require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob('config/locales/**.yml')
I18n.load_path << path
# path2 = Dir["#{File.expand_path('config/locales')}/*.yml"]
I18n.default_locale = 'en'
