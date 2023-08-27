class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :clinic

  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validate :unique_reservation_for_doctor_on_same_day_and_time

  private
  def unique_reservation_for_doctor_on_same_day_and_time
    existing_reservation = Reservation.where(
      doctor_id: doctor_id,
      reservation_date: reservation_date,
      reservation_time: reservation_time
    ).where.not(id: id) #exclude current reservation when updating

    if existing_reservation.exists?
      errors.add(:base, "Doctor already has a reservation at the same day and time")
    end
  end
end
