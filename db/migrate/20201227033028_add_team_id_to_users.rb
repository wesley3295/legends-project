class AddTeamIdToUsers < ActiveRecord::Migration
  def change
    add_column :teams, :users_id, :integer
  end
end
