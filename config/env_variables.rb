require 'i18n'
require 'dotenv'
Dotenv.load
I18n.load_path += Dir.glob('./config/locales/**.yml')
puts I18n.load_path.to_s
I18n.default_locale = 'en'
