require 'kronic'

module Parser
  def self.parse phrase
    pattern = /([A-z]+) (.*) ([^ ].*) ([0-9]{1,2})-([0-9]{1,2})(?: (.*))?/
    phrase.scan(pattern).map do |first_name, adjective, second_name, first_score, second_score, date|
      game = {}
      # this is a cheat because I can't think of any single word that makes the
      # first name the loser.
      first_is_winner = adjective.split(' ').size == 1

      # find winners and losers
      names = [first_name, second_name]
      game[:winner], game[:loser] = *(first_is_winner ? names : names.reverse)

      # find winner and loser scores
      scores = [first_score, second_score].map(&:to_i)
      game[:winner_score], game[:loser_score] = scores.sort.reverse

      # find date
      game[:played_date] = Kronic.parse(date) || Date.today
      game
    end.first
  end
end
