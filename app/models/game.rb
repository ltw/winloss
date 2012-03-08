require 'parser'

class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'User'
  belongs_to :loser, :class_name => 'User'

  validates :winner_id, :loser_id, :presence => true
  validates :winner_score, :loser_score, :presence => true
  validates :played_date, :presence => true

  def self.parse phrase
    GameCreator.new Parser.parse(phrase)
  end

  def self.parse! phrase
    parse(phrase).save!
  end
end
