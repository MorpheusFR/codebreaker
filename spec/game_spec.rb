module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }

    describe '#validate_turn' do
      # before { game.validate_turn }

      it 'saves secret string with numbers from 1 to 6' do
        expect(game.instance_variable_get(:@secret_code)).to match(/^[1-6]{4}\z/)
      end

      it 'set attempts to Game::ATTEMPTS' do
        expect(game.total_attempts).to eql(ATTEMPTS)
      end
    end
  end
end