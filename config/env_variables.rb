require 'i18n'
require 'dotenv'
Dotenv.load
I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
I18n.default_locale = ENV['language']
