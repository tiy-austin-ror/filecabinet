class Category < ApplicationRecord
  has_many :notes
  has_many :images

  has_many :children_categories, class_name: "Category", foreign_key: "children_category_id"

  belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_category_id"

  validates :name, presence: true
end
