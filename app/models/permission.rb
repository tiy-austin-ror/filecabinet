class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :permission, polymorphic: true

  validates :full_access, inclusion: { in: [ true, false ] }
  validates :user_id, uniqueness: { scope: [:permission_id, :permission_type]}
end
