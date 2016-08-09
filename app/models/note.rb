class Note < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :tags

  validates :name, presence: true
  validates :body, presence: true
  validates :file_type, presence: true

  def note_with_type
    "#{self.name}.#{self.file_type}"
  end
end
