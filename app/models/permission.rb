class Permission < ApplicationRecord
  belongs_to :user

  belongs_to :permission, polymorphic: true

  validates :full_access, inclusion: { in: [ true, false ] }
end
