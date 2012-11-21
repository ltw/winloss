class User < ActiveRecord::Base
  has_and_belongs_to_many :teams
  validates :name, presence: true, uniqueness: true

  def self.top_ranked(count=nil)
    users = all.sort {|x,y| y.points_per_game <=> x.points_per_game }
    users = users.first(count) if count
    users
  end

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

  def as_json(options)
    options[:only] = []
    options[:only] << :name
    options[:methods] = []
    options[:methods] << :points_per_game
    super(options)
  end
end
