class AddTeamidToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :team_id, :integer
  end
end
