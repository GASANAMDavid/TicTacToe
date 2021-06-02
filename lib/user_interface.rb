module UserInterface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin

  def self.display_instructions
    output.puts "\n\n  Instructions\n::::::::::::::::\n\n"
    output.puts " 1. Players choose a unique symbol to use as a mark throught the game.\n"
    output.puts " 2. The game is played on a grid of 3 by 3.\n"
    output.puts " 3. Players take turns putting their marks into empty squares.\n"
    output.puts " 4. The first player to put 3 symbols in a any of 3 rows and 3 columns or any of the diagnols is the WINNER.\n"
    output.puts " 5. If all 9 squares are full and there is no winner the game is TIED and Over.\n\n"
    output.puts ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n\n\n"
  end

  def self.player_info
    output.puts "Enter player's name."
    name = input.gets.chomp
    output.puts "Enter player's symbol."
    symbol = input.gets.chomp
    { name: name, symbol: symbol }
  end

  def self.see_board(board)
    board.each do |row|
      output.puts row.to_s
    end
  end

  def self.see_available_free_position(free_spaces)
    free_spaces.each do |key, value|
      output.puts "position number: #{key} indices: #{value}"
    end
  end

  def self.get_players_move
    output.puts 'Enter your choice'
    input.gets.chomp.to_i
  end

  def self.display_which_player_turn(current_player)
    output.puts "#{current_player.name}'s turn"
  end

  def self.display_game_outcome(game_status)
    output.puts game_status
  end

  def display_game_modes
    output.puts "\t\tGame Modes\n~~~~~~~~~~~~~\n\n"
    output.puts "1. Human Vs Human\n"
    output.puts '2. Human Vs Computer'
  end
end
