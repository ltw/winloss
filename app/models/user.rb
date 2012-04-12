class User < ActiveRecord::Base

  def points_per_game
    scores.reduce(0, :+).to_f / scores.length
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
end
