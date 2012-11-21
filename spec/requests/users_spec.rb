require 'spec_helper'

describe "Users" do
  let!(:nate)  { User.create! :name => 'Nate' }
  let!(:lucas) { User.create! :name => 'Lucas' }

  describe "GET /users" do
    it "works!" do
      get users_path
      response.status.should be(200)
      data = JSON.parse(response.body)['users']
      data.size.should == 2
    end

    it 'returns a limited number of users' do
      get users_path, :count => 1
      response.status.should be(200)
      data = JSON.parse(response.body)['users']
      data.size.should == 1
    end
  end
end
