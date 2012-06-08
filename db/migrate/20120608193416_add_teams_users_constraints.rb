class AddTeamsUsersConstraints < ActiveRecord::Migration
  def up
    add_foreign_key_constraint :teams_users, :teams
    add_foreign_key_constraint :teams_users, :users
  end

  def down
    remove_foreign_key_constraint :teams_users, :teams
    remove_foreign_key_constraint :teams_users, :users
  end
end
