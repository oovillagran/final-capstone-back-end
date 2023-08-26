class ClinicSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :address, :doctor_id
end
