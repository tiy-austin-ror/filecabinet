class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, foreign_key: true
      t.string :taggable_type
      t.integer :taggable_id

      t.timestamps
    end
  end
end
