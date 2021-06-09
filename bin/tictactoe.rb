require_relative '../config/interface'
require_relative '../config/setup'
require_relative '../config/env_variables'

Interface.display_instructions
game_on = true
while game_on
  choice = Interface.choose_mode
  game = GameSetUp.setup(choice)
  game.play
  puts I18n.t('prompt_continue_or_exit_game')
  choice = gets.chomp
  game_on = choice.downcase == 'y'
  system('clear')
end
