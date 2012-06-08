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
    Game.count.should eq 1
    Game.first.winner.should eq nate
    Game.first.loser.should eq lucas
  end

  it 'should reaverage scores' do
    nate_line = find(:css, "section#leaderboard table tr#user_#{nate.id} td.all-time .points-per-game")
    nate_line.text.strip.should eq '21.00'

    lucas_line = find(:css, "section#leaderboard table tr#user_#{lucas.id} td.all-time .points-per-game")
    lucas_line.text.strip.should eq '19.00'
  end
end
