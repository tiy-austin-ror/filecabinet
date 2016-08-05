class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :name, presence: true

  def note_with_type
    "#{photo.name}.#{photo.file_type}"
  end
end
