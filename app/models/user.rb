class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :projects

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  normalizes :email, with: ->(e) { e.strip.downcase }
end
