class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :doctors

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 15 }
  validates :birthdate, presence: true
  validates :username, presence: true, length: { maximum: 15 }
  validates_uniqueness_of :username, case_sensitive: false
end
