class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note, polymorphic: true
  belongs_to :photo, polymorphic: true
end
