class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
