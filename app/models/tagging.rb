class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note, polymorphic: true, optional: true
  belongs_to :photo, polymorphic: true, optional: true
end
