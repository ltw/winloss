class TeamGameCreator
  def self.new(options)
    winner = options.delete(:winner_name)
    loser = options.delete(:loser_name)
    teams = find_teams_for_players(winner, loser)

    TeamGame.new options.merge(teams)
  end

  protected

  def self.find_teams_for_players(winner, loser)
    teams = {}
    [:winner, :loser].each do |field|
      name = field == :winner ? winner : loser
      team = Team.find_by_name(name)
      team = Team.create_from_user_names(name.split(' + ')) if team.nil?
      teams[field] = team
    end
    teams
  end
end
