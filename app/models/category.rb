class Category < ApplicationRecord
  has_many :notes
  has_many :images

  belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_category_id", optional: true

  validates :name, presence: true
end
