class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :clinic

  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
end

