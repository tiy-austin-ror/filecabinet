class Category < ApplicationRecord
  has_many :notes
  has_many :images
<<<<<<< HEAD

=======
>>>>>>> b3a9bf3e110ed3d2f75ea628112fc61dbbdc98a8
  belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_category_id", optional: true

  validates :name, presence: true
end
