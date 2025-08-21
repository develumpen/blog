class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }
end
