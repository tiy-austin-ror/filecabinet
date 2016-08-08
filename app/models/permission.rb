class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :note, polymorphic: true, optional: true
  belongs_to :photo, polymorphic: true, optional: true

  validates :full_access, inclusion: { in: [ true, false ] }
end
