require_relative '../../config/game_set_up'

RSpec.describe GameSetUp do
  describe '.setup' do
    before do
      allow(GameSetUp).to receive(:system).with('clear').at_most(3).times
      allow(GameInterface).to receive(:human_player_info).and_return({ name: 'David', symbol: 'D' })
      allow(GameInterface).to receive(:choose_who_plays_first).and_return(1)
      expect(GameInterface).to receive(:prompt_board_size).and_return(3)
    end

    context "set up the game from user's mode choice" do
      it 'configures the game engine to be human vs. human when choice is one' do
        choice = 1
        engine = GameSetUp.setup(choice)
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(Human)
      end

      it 'configures the game engine to be human vs. random computer when choice is two' do
        choice = 2
        allow(GameInterface).to receive(:random_computer_info).and_return({ name: 'random computer', symbol: 'O' })
        engine = GameSetUp.setup(choice)
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(RandomComputer)
      end

      it 'configures the game engine to be human vs. intelligent computer when choice is three' do
        choice = 3
        engine = GameSetUp.setup(choice)
        allow(GameInterface).to receive(:intelligent_computer_info).and_return({ name: 'intelligent computer',
                                                                                 symbol: 'O' })
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(IntelligentComputer)
      end
    end
  end
end
