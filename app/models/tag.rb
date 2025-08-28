class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :entries, through: :taggings

  default_scope { order(:name) }

  validates :name, presence: true
end
