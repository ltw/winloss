require 'spec_helper'

describe "Games" do
  let!(:nate)  { User.create! :name => 'Nate' }
  let!(:lucas) { User.create! :name => 'Lucas' }

  describe "GET /games" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get games_path
      response.status.should be(200)
    end

    it 'returns games in JSON format' do
      get games_path, :format => :json
      response.status.should be(200)
      data = JSON.parse(response.body)['games']
      data.should be_empty
    end

    it 'returns a limited number of games' do
      (0..5).each do |i|
        Game.create!({
          :winner => nate,
          :loser => lucas,
          :winner_score => (21 - i),
          :loser_score => (0 + i),
          :played_date => (Date.parse('2012-03-01 00:00') + i.days)
        })
      end
      get games_path, :format => :json, :count => 3
      response.status.should be(200)
      data = JSON.parse(response.body)['games']
      data.size.should == 3
      data.first['winner_score'].should == 16
    end
  end
end
