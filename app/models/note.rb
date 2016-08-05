class Note < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :name, presence: true
  validates :body, presence: true
  validates :file_type, presence: true

  def note_with_type
    "#{note.name}.#{note.file_type}"
  end
end
