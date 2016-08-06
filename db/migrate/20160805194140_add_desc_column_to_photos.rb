class AddDescColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :desc, :string
  end
end
