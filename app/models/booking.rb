class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :airplane
  validates :start_day, presence: true
  validates :end_day, presence: true, comparison: { greater_than: :start_day }
end
