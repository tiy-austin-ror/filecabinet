class RemovePolymorphismFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :member_type, :string
    remove_column :members, :member_id, :string
  end
end
