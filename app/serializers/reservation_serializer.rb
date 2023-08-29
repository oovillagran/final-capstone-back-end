class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :reservation_date, :reservation_time, :status, :user_id, :doctor_id, :clinic_id
  belongs_to :user
  belongs_to :doctor
  belongs_to :clinic
end
