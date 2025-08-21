class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :entry

  scope :persisted, -> { where.not(id: nil) }

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :comment, presence: true
end
