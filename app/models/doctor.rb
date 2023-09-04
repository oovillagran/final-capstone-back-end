class Doctor < ApplicationRecord
  belongs_to :user
  has_one :specialty, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :clinics, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :photo, length: { maximum: 200 }
  validates :bio, presence: true, length: { maximum: 500 }
end
