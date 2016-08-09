class Tag < ApplicationRecord
  has_many :taggings
  belongs_to :note

  validates :name, presence: true
end
