require 'spec_helper'
require 'pry'

describe 'Entering a game result' do
  let!(:nate)  { User.create! :name => 'Nate' }
  let!(:lucas) { User.create! :name => 'Lucas' }

  before do
    visit root_path
    fill_in 'result', with: 'Nate beat Lucas 21-19'
    click_button 'Record'
  end

  it 'should add a game' do
    Game.count.should == 1
    Game.first.winner.should == nate
    Game.first.loser.should  == lucas
  end

  it 'should reaverage scores' do
    nate_line = find(:css, "section#leaderboard table tr#user_#{nate.id} .points_per_game")
    nate_line.text.strip.should == '21.00'
    lucas_line = find(:css, "section#leaderboard table tr#user_#{lucas.id} .points_per_game")
    lucas_line.text.strip.should == '19.00'
  end
end
