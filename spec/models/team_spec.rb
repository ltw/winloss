require 'spec_helper'

describe Team do
  context 'setting team name' do
    let(:users) { ['Odin', 'Adrian'].map {|name| User.create! :name => name } }
    let(:team)  { Team.new }
    before do
      team.users += users
    end

    it 'should join the member users together' do
      team.set_team_name.should == 'Adrian + Odin'
    end

    it 'should save the name on create' do
      team.save
      team.name.should == 'Adrian + Odin'
    end
  end
end
