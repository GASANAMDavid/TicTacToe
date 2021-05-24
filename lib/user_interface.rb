module UserInterface
  def self.display_instructions(output = $stdout)
    output.puts "\n\n  Instructions\n::::::::::::::::\n\n"
    output.puts " 1. Players choose a unique symbol as a mark to use throught the game.\n"
    output.puts " 2. The game is played on a grid of 3 by 3.\n"
    output.puts " 3. Players take turns putting their marks into empty squares.\n"
    output.puts " 4. The first player to put 3 symbols in a any of 3 rows and 3 columns or any of the diagnols is the WINNER.\n"
    output.puts " 5. If all 9 squares are full and there is no winner the game is TIED and Over.\n\n"
  end
end
