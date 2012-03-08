require 'spec_helper'

describe GameCreator do
  let(:options) do
    options = {
      :winner_name  => 'Lucas',
      :loser_name   => 'Odin',
      :winner_score => 21,
      :loser_score  => 2,
      :played_date  => Date.today
    }
  end

  before do
    User.stub(:find_by_name).and_return { mock_model(User) }
  end

  it 'should create a new game' do
    GameCreator.new(options).should be_valid
  end
end
