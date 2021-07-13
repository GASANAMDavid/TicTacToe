# frozen_string_literal: true

require 'i18n'
require 'dotenv'
Dotenv.load
path = Dir.glob("#{File.dirname(__FILE__)}/../config/locales/**.yml")
I18n.load_path += path
