class AddAccessToPermissions < ActiveRecord::Migration[5.0]
  def change
    add_column :permissions, :full_access, :boolean, default: false
  end
end
