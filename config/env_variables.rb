require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob('./config/locales/**.yml')
I18n.load_path += path
I18n.default_locale = 'en'
