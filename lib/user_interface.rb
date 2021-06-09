require_relative '../config/env_variables'
module UserInterface
  class << self; attr_accessor :output, :input end
  self.output = $stdout
  self.input = $stdin

  def self.see_board(board)
    board.each do |row|
      output.puts row.to_s
    end
  end

  def self.get_players_move
    output.puts I18n.t('choose_move_msg')
    input.gets.chomp.to_i
  end

  def self.display_which_player_turn(current_player)
    output.puts I18n.t('current_player_name', name: current_player.name)
  end

  def self.display_game_outcome(game_status)
    output.puts game_status
  end
end
