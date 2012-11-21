require 'parser'

class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'User'
  belongs_to :loser, :class_name => 'User'

  validates :winner_id, :loser_id, :presence => true
  validates :winner_score, :loser_score, :presence => true
  validates :played_date, :presence => true

  scope :for_user, lambda { |user| where('winner_id = :user_id OR loser_id = :user_id', user_id: user.id) }

  def self.parse phrase
    GameCreator.new Parser.parse(phrase)
  end

  def self.parse! phrase
    parse(phrase).save!
  end

  def self.scores_for(user)
    for_user(user).select("(CASE WHEN winner_id = #{user.id} THEN winner_score ELSE loser_score END) as score").map { |game| game.score.to_i }
  end

  def winner_name
    winner.name
  end

  def loser_name
    loser.name
  end

  def as_json(options=nil)
    options[:only] = options[:methods] = []
    options[:only] << :winner_score
    options[:only] << :loser_score
    options[:only] << :played_date
    options[:methods] << :winner_name
    options[:methods] << :loser_name
    super(options)
  end
end
