class TeamGameCreator
  def self.new(options)
    winner = options.delete(:winner_name)
    loser = options.delete(:loser_name)
    teams = find_teams_for_players(winner, loser)

    TeamGame.new options.merge(teams)
  end

  protected

  def self.find_teams_for_players(winner, loser)
    {
      :winner => Team.find_by_name(winner),
      :loser  => Team.find_by_name(loser)
    }
  end
end
