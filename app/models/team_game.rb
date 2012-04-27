require 'parser'

class TeamGame < ActiveRecord::Base
  belongs_to :winner, :class_name => 'Team'
  belongs_to :loser, :class_name => 'Team'

  validates :winner_id, :loser_id, :presence => true
  validates :winner_score, :loser_score, :presence => true
  validates :played_date, :presence => true

  scope :for_team, lambda { |team| where("winner_id = #{team.id} OR loser_id = #{team.id}") }

  def self.parse phrase
    TeamGameCreator.new Parser.parse(phrase)
  end

  def self.parse! phrase
    parse(phrase).save!
  end
end
