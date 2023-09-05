require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  shared_context 'response content example' do
    after do |example|
      example.metadata[:response][:content] = {
        'application/json' => {
          example: JSON.parse(response.body, symbolize_names: true)
        }
      }
    end
  end

  describe 'GET /api/v1/users/{user_id}/reservations' do
    path '/api/v1/users/{user_id}/reservations' do
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

      get('list reservations') do
        response(200, 'successful') do
          let(:user_id) { '123' }
          include_context 'response content example'
        end
      end
    end
  end

  describe 'POST /api/v1/users/{user_id}/reservations' do
    path '/api/v1/users/{user_id}/reservations' do
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

      post('create reservation') do
        response(200, 'successful') do
          let(:user_id) { '123' }
          include_context 'response content example'
        end
      end
    end
  end

  describe 'GET /api/v1/users/{user_id}/reservations/{id}' do
    path '/api/v1/users/{user_id}/reservations/{id}' do
      parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('show reservation') do
        response(200, 'successful') do
          let(:user_id) { '123' }
          let(:id) { '123' }
          include_context 'response content example'
        end
      end
    end
  end
end

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
