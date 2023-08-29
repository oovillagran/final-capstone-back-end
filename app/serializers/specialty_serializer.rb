class SpecialtySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :doctor
end
