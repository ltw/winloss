class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id, :null => false
      t.integer :loser_id, :null => false
      t.integer :winner_score, :null => false
      t.integer :loser_score, :null => false
      t.date :played_date, :null => false

      t.timestamps
    end

    add_foreign_key_constraint :games, :users, :referencing => 'winner_id'
    add_foreign_key_constraint :games, :users, :referencing => 'loser_id'
  end
end
