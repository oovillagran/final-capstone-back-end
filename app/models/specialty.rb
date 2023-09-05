class Specialty < ApplicationRecord
  belongs_to :doctor

  validates :name, presence: true, length: { maximum: 100 }
end
