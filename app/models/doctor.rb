class Doctor < ApplicationRecord
  belongs_to :user
  has_many :specialties
  has_many :reservations
  has_many :clinics

  validates :name, presence: true, length: { maximum: 50 }
  validates :photo, length: { maximum: 200 }
  validates :bio, presence: true, length: { maximum: 500 }
end
