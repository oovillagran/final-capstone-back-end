class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :bio, :experience_years
  belongs_to :user
  has_one :specialty
end
