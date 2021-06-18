require_relative 'TicTacToe/version'
require_relative './user_interface'

# Testing exposed interfaces in the gem
module Hello
  def self.hello
    puts 'Hello World!'
  end
end
