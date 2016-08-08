class RemovePermissionTypeAndIdFromPermissions < ActiveRecord::Migration[5.0]
  def change
    remove_column :permissions, :permission_type, :string
    remove_column :permissions, :permission_id, :integer
  end
end
