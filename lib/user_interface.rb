class UserInterface
  def display_instructions(output = $stdout)
    output.puts "\n\n  Instructions\n::::::::::::::::\n\n"
    output.puts " 1. Players choose a unique symbol to use as a mark throught the game.\n"
    output.puts " 2. The game is played on a grid of 3 by 3.\n"
    output.puts " 3. Players take turns putting their marks into empty squares.\n"
    output.puts " 4. The first player to put 3 symbols in a any of 3 rows and 3 columns or any of the diagnols is the WINNER.\n"
    output.puts " 5. If all 9 squares are full and there is no winner the game is TIED and Over.\n\n"
  end

  def player_symbols(output = $stdout, input = $stdin)
    output.puts "Enter player's name."
    name = input.gets.chomp
    output.puts "Enter player's symbol."
    symbol = input.gets.chomp
    { name: name, symbol: symbol }
  end

  def see_board(board, output = $stdout)
    board.each do |row|
      output.puts row.to_s
    end
  end

  def see_available_free_position(free_spaces, output = $stdout)
    free_spaces.each do |key, value|
      output.puts "position number: #{key} indices: #{value}"
    end
  end

  def get_players_move(output = $stdout, input = $stdin)
    output.puts 'Enter your choice'
    input.gets.chomp.to_i
  end
end
