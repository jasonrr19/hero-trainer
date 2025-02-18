class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates :start_time, presence: true, comparison: { greater_than: Time.current }
  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
