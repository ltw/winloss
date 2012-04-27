require 'spec_helper'

describe TeamGame do
  context 'parsing' do
    subject { described_class }
    it { should respond_to :parse }
    it { should respond_to :parse! }

    context do
      before do
        Team.stub(:find_by_name).and_return { mock_model(Team) }
      end

      it 'returns a valid game when parsing a correct string' do
        TeamGame.parse('Adrian + Odin beat Lucas + Nate 21-7').should be_valid
      end
    end

    it 'tries to save on parse!' do
      game = double 'team_game'
      TeamGame.stub(:parse).and_return game
      game.should_receive(:save!).once

      TeamGame.parse! 'Adrian + Odin beat Lucas + Nate 21-7'
    end
  end

  context 'for_user' do
    it 'should select games where the user is either the winner or the loser' do
      TeamGame.for_team(OpenStruct.new(:id => 5)).to_sql.should =~ /WHERE \(winner_id = 5 OR loser_id = 5\)$/
    end
  end
end
