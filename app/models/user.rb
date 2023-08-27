class User < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  has_secure_password
  has_many :reservations
  has_many :doctors

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 15 }
  validates :birthdate, presence: true
end
