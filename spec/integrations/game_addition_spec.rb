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

describe 'Entering a team game result' do
  let!(:adrian) { User.create! :name => 'Adrian' }
  let!(:lucas)  { User.create! :name => 'Lucas' }
  let!(:nate)   { User.create! :name => 'Nate' }
  let!(:tate)   { User.create! :name => 'Tate' }

  before do
    visit root_path
    fill_in 'result', with: 'Adrian + Lucas beat Nate + Tate 21-14'
    select 'Team', from: 'game_type'
    click_button 'Record'
  end

  it 'should add a team game' do
    TeamGame.count.should eq 1
    TeamGame.first.winner.users.should eq [adrian, lucas]
    TeamGame.first.loser.users.should eq [nate, tate]
  end
end
