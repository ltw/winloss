module GamesHelper
  def game_entry(game)
    content_tag :li, :class => 'game', :id => dom_id(game) do
      content = content_tag :span, game.winner, :class => 'winner'
      content += ' beat '
      content += content_tag :span, game.loser, :class => 'loser'
      content += ' '
      content += content_tag :span, "#{game.winner_score}-#{game.loser_score}", :class => 'score'
      content += ' on '
      content += content_tag :span, game.played_date, :class => 'game_date'
      content
    end
  end

  def ranking_for(user, date_range)
    games = date_range ? Game.where(played_date: date_range) : Game.scoped
    scores = games.scores_for(user)
    if scores.present?
      content = content_tag :span, number_with_precision(points_per_game(scores), precision: 2), :class => 'points-per-game'
      content += ' / '
      content += content_tag :span, scores.count, :class => 'count'
      content
    else
      content_tag :span, '--', :class => 'points-per-game'
    end
  end

  def points_per_game(scores)
    scores.empty? ? 0 : scores.reduce(0, :+).to_f / scores.length
  end
end
