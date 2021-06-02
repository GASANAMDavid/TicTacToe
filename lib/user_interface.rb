module UserInterface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin

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
end
