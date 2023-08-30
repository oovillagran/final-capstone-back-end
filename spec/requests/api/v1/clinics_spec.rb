require 'rails_helper'

RSpec.describe 'Api::v1::Clinics', type: :request do
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
    @doctor = Doctor.create(name: 'Eric Antwi', photo: 'myprofile.png', bio: 'I am a dentist', experience_years: '3',
                            user_id: @user.id)
    @clinic = Clinic.create(name: 'Ridge Hospital', city: 'Accra', address: '29th street, Madina',
                            doctor_id: @doctor.id)
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/api/v1/clinics'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
