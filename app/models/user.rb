class User < ActiveRecord::Base
  has_and_belongs_to_many :teams
  validates :name, presence: true, uniqueness: true

  def games
    Game.for_user(self)
  end

  def points_per_game
    scores.empty? ? 0 : scores.reduce(0, :+).to_f / scores.length
  end

  def scores
    games.scores_for(self)
  end

  def to_s
    name
  end
end
