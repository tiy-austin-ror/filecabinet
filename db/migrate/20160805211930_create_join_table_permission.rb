class CreateJoinTablePermission < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :permission_type
      t.integer :permission_id

      t.timestamps
    end
  end
end
