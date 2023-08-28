
class Clinic < ApplicationRecord
  belongs_to :doctor

  validates :name, presence: true, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 200 }
end
