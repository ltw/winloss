class User < ActiveRecord::Base
  def games
    Game.for_user(self)
  end

  def points_per_game
    scores.empty? ? 0 : scores.reduce(0, :+).to_f / scores.length
  end

  def scores
    connection.select_rows(<<-SQL
      SELECT    (CASE WHEN winner_id = #{self.id} THEN winner_score ELSE loser_score END) as score
      FROM      games
      WHERE     winner_id = #{self.id}
      OR        loser_id = #{self.id}
    SQL
    ).flatten.map(&:to_i)
  end

  def games_count
    scores.count
  end

  def to_s
    name
  end
end
