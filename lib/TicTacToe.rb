require_relative 'TicTacToe/version'

# Testing exposed interfaces in the gem
module Hello
  def self.hello
    puts 'Hello World!'
  end
end
