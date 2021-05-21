module UserInterface
  def self.display_instructions(output = $stdout)
    output.puts "\n\n  Instructions\n::::::::::::::::\n\n"
    output.puts " 1. Players choose a symbol to use throught the game.\n"
  end
end
