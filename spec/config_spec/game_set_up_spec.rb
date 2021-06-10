require_relative '../../config/game_set_up'

RSpec.describe GameSetUp do
  describe '.setup' do
    before do
      allow(GameSetUp).to receive(:system).with('clear').at_most(3).times
      allow(GameInterface).to receive(:human_player_info).and_return({ name: 'David', symbol: 'D' })
      allow(GameInterface).to receive(:choose_who_plays_first).and_return(1)
      expect(GameInterface).to receive(:make_board)
    end

    context 'when we pick the first choice' do
      it 'configures the game engine to be human vs. human' do
        choice = 1
        engine = GameSetUp.setup(choice)
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(Human)
      end

      it 'configures the game engine to be human vs. random computer' do
        choice = 2
        allow(GameInterface).to receive(:random_computer_info).and_return({ name: 'random computer', symbol: 'O' })
        engine = GameSetUp.setup(choice)
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(RandomComputer)
      end

      it 'configures the game engine to be human vs. random computer' do
        choice = 3
        engine = GameSetUp.setup(choice)
        allow(GameInterface).to receive(:random_computer_info).and_return({ name: 'random computer', symbol: 'O' })
        expect(engine.first_player).to be_a(Human)
        expect(engine.second_player).to be_a(IntelligentComputer)
      end
    end
  end
end
