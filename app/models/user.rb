class User < ApplicationRecord
  include Clearance::User

  has_many :notes
  has_many :photos
  has_many :categories

  has_many :permissions
  has_many :shared_notes, through: :permissions, source: :permission, source_type: "Note"
  has_many :shared_photos, through: :permissions, source: :permission, source_type: "Photo"

  validates :name, presence: true
  validates :email, presence: true
end
