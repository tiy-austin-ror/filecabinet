class Category < ApplicationRecord
  has_many :notes
  has_many :photos

  has_many :children, class_name: "Category", foreign_key: :parent_category_id
  belongs_to :parent, class_name: "Category", foreign_key: :parent_category_id, optional: true

  validates :name, presence: true
end
