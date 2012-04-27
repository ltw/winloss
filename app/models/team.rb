class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  before_create :set_team_name

  def set_team_name
    self.name ||= self.users.map(&:name).sort.join(' + ')
  end

  def games
    TeamGame.for_team(self)
  end

  def points_per_game
    scores.empty? ? 0 : scores.reduce(0, :+).to_f / scores.length
  end

  def scores
    connection.select_rows(<<-SQL
      SELECT    (CASE WHEN winner_id = #{self.id} THEN winner_score ELSE loser_score END) as score
      FROM      team_games
      WHERE     winner_id = #{self.id}
      OR        loser_id = #{self.id}
    SQL
    ).flatten.map(&:to_i)
  end
end
