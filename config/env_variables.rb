require 'i18n'
require 'dotenv'
# puts 'Test env variables'
Dotenv.load
path = Dir["#{File.expand_path('config/locales')}/*.yml"]
puts path
# I18n.load_path << 
# I18n.default_locale = 'en'
# puts 'after everything'
