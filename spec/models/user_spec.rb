require 'spec_helper'

describe User do
  context 'scores' do
    let(:winner) { User.create! :name => 'Lucas' }
    let(:loser)  { User.create! :name => 'Odin' }
    let!(:games) do
      [5,7,8].map {|num| Game.create! :winner => winner, :loser => loser, :winner_score => 21, :loser_score => num, :played_date => Date.today }
    end

    it 'should return scores' do
      loser.scores.should eq [5,7,8]
    end
  end
end
