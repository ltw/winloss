class GameCreator
  def self.new(options)
    winner = options.delete(:winner_name)
    loser = options.delete(:loser_name)
    players = find_users_for_players(winner, loser)

    Game.new options.merge(players)
  end

  protected

  def self.find_users_for_players(winner, loser)
    {
      :winner => User.find_by_name(winner),
      :loser  => User.find_by_name(loser)
    }
  end
end
