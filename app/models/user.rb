class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
end
