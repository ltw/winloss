class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  before_create :set_team_name

  def set_team_name
    self.name ||= self.users.map(&:name).sort.join(' + ')
  end
end
