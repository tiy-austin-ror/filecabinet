class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :note, polymorphic: true
  belongs_to :photo, polymorphic: true
end
