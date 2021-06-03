require_relative '../config/interface'
require_relative '../config/setup'

Interface.display_instructions
loop do
  choice = Interface.choose_mode
  game = GameSetUp.setup(choice)
  game.play
  puts "\n\nPress Y to continue| N to exit"
  choice = gets.chomp
  break unless choice.downcase == 'y'
end
