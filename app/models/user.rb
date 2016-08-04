class User < ApplicationRecord
  include Clearance::User

  has_many :notes
  has_many :photos

  validates :name, presence: true
  validates :email, presence: true
end
