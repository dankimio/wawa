class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  def avatar_color
    digest = Digest::MD5.hexdigest(name)

    # Use the first 6 characters of the digest as the color code
    color = "##{digest[0..5]}"

    # Output the color code
    color
  end
end
