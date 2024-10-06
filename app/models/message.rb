class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :body, presence: true

  after_create_commit -> { broadcast_prepend_to room }
end
