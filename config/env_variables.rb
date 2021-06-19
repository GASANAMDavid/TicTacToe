require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob("#{File.dirname(__FILE__)}/locales/**.yml")
puts path
I18n.load_path += path
