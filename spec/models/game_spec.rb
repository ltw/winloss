require 'spec_helper'

describe Game do
  context 'parsing' do
    subject { described_class }
    it { should respond_to :parse }
    it { should respond_to :parse! }

    # TODO: make this not require two DB reads when creating users
    it 'should return a valid game when parsing a correct string' do
      Game.parse('Odin beat Lucas 21-7').should be_valid
    end

    it 'should try to save on parse!' do
      game = double('game')
      Game.stub(:parse).and_return game
      game.should_receive(:save!).once

      Game.parse!('Odin beat Lucas 21-7')
    end
  end
end
