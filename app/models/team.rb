class Team < ApplicationRecord
  belongs_to :users, optional: true
  has_many :team_members, through: :members, source: :user

  validates :name, presence: true
end
