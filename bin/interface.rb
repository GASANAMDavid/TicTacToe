require_relative '../lib/players/human'
module Interface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin
  def self.display_instructions
    system('clear')
    output.puts "\t\t\tWelcome to TIC TAC TOE Game\n"
    output.puts "\n\n\n  Instructions\n::::::::::::::::\n\n"
    output.puts " 1. Players choose a unique symbol to use as a mark throught the game.\n"
    output.puts " 2. The game is played on a grid of 3 by 3.\n"
    output.puts " 3. Players take turns putting their marks into empty squares.\n"
    output.puts " 4. The first player to put 3 symbols in a any of 3 rows and 3 columns or any of the diagnols is the WINNER.\n"
    output.puts " 5. If all 9 squares are full and there is no winner the game is TIED and Over.\n\n"
    output.puts ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n\n\n"
  end

  def self.choose_mode
    output.puts "\t\tGame Modes\n\t\t~~~~~~~~~~\n\n"
    output.puts "\t1. Human Vs Human\n"
    output.puts "\t2. Human Vs Dummy Computer\n"
    output.puts "\t3. Human Vs Intelligent Computer\n"
    output.puts "\t4. Intelligent Vs Intelligent Computer\n"

    output.puts "\nChoose a number correspoding to your choice:\n"
    input.gets.chomp.to_i
  end

  def self.player_info
    output.puts "Enter player's name."
    name = input.gets.chomp
    output.puts "Enter player's symbol."
    symbol = input.gets.chomp
    { name: name, symbol: symbol }
  end
end
