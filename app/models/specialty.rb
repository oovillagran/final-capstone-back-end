class Specialty < ApplicationRecord
  belongs_to :doctor

  validates :specialty_type, presence: true, length: { maximum: 100 }
end
