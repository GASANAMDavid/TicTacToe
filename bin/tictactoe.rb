require_relative 'interface'

Interface.display_instructions
loop do
  game_mode = Interface.choose_mode

  puts 'Press Y to continue| N to exit'
  choice = gets.chomp
  break unless choice.downcase == 'y'
end
