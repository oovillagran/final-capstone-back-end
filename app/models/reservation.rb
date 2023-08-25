class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :clinic
end
