require 'rails_helper'

RSpec.describe 'Api::v1::Clinics', type: :request do
  before(:each) do
    @user = User.create(
      first_name: 'Eric',
      last_name: 'Antwi',
      birthdate: Date.parse('30-09-2001'),
      phone_number: '+233206546917',
      username: 'Mylo16',
      email: 'ericopokuantwi384@gmail.com',
      password: '123456'
    )
    @doctor = Doctor.create(name: 'Eric Antwi', photo: 'myprofile.png', bio: 'I am a dentist', experience_years: '3',
                            user_id: @user.id)
    @clinic = Clinic.create(name: 'Ridge Hospital', city: 'Accra', address: '29th street, Madina',
                            doctor_id: @doctor.id)
    @reservation = Reservation.create(reservation_date: '2020-08-09', reservation_time: '12:00', status: 'completed',
                                      user_id: @user.id, doctor_id: @doctor.id, clinic_id: @clinic.id)
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get "/api/v1/users/#{@user.id}/reservations"
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
