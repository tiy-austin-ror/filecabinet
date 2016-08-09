class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :tags

  has_many :permissions, as: :permission
  has_many :users_with_access, through: :permissions, source: :user

  has_attached_file :upload, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upload, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :desc, presence: true
  validates :upload, attachment_presence: true
end
