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
end
