class CreateTeamGames < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.integer :winner_id, :null => false
      t.integer :loser_id, :null => false
      t.integer :winner_score, :null => false
      t.integer :loser_score, :null => false
      t.date :played_date, :null => false

      t.timestamps
    end

    add_foreign_key_constraint :team_games, :teams, :referencing => 'winner_id'
    add_foreign_key_constraint :team_games, :teams, :referencing => 'loser_id'
  end
end
