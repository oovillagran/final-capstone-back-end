require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create(
      first_name: 'Eric',
      last_name: 'Antwi',
      birthdate: Date.parse('30-09-2001'),
      role: 'user',
      phone_number: '+233206546917',
      username: 'Mylo16',
      email: 'ericopokuantwi384@gmail.com',
      password: '123456'
    )
    @doctor = Doctor.create(name: "Eric Antwi", photo: 'myprofile.png', bio: 'I am a dentist', experience_years: '3', user_id: @user.id)
    @clinic = Clinic.create(name: 'Ridge Hospital', city: 'Accra', address: '29th street, Madina', doctor_id: @doctor.id)
    @reservation = Reservation.create(reservation_date: '29-08-2021', reservation_time: '13:00', status: 'completed', user_id: @user.id, doctor_id: @doctor.id, clinic_id: @clinic.id)
  end

  describe 'Reservation validations' do
    it 'has valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'is not valid without reservation date and time' do
      @reservation.reservation_date = nil
      @reservation.reservation_time = nil
      expect(@reservation).to_not be_valid
    end
  end
end
