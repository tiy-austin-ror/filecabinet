class Category < ApplicationRecord
  has_many :notes
  has_many :photos

  has_many :children, class_name: "Category", foreign_key: :parent_category_id
  belongs_to :parent, class_name: "Category", foreign_key: :parent_category_id, optional: true

  validates :name, presence: true

  def ancestors
    cats = []
    current_cat = self
    while current_cat do
      cats << current_cat
      current_cat = current_cat.parent
    end

    cats.reverse!.pop
    cats
  end

  # def ancestors(cats = [])
  #   cats.push(self)
  #   return cats.drop(1).reverse if parent.nil?
  #   parent.ancestors(cats)
  # end

end
