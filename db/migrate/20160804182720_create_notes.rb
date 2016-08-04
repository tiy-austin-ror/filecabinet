class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false
      t.string :file_type, null: false

      t.timestamps
    end
  end
end
