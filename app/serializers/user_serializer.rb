class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :phone_number, :birthdate, :role, :email
  has_many :reservations
  has_many :doctors
end
