class Specialty < ApplicationRecord
  belongs_to :doctor

  validates :type, presence: true, length: { maximum: 100 }
end
