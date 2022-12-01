class Airplane < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :weight, presence: true, comparison: { greater_than: 0 }
  validates :registration, presence: true
  validates :number_of_engines, presence: true
  validates :brand_and_model, presence: true
  validates :pax_capacity, presence: true
  validates :range, presence: true
  validates :speed, presence: true
  validates :max_altitude, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
