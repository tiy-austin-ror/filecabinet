class CreateJoinTableMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :user, foreign_key: true
      t.string :member_type
      t.integer :member_id

      t.timestamps
    end
  end
end
