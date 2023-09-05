require 'swagger_helper'

RSpec.describe 'api/v1/specialties', type: :request do
  shared_context 'response content example' do
    after do |example|
      example.metadata[:response][:content] = {
        'application/json' => {
          example: JSON.parse(response.body, symbolize_names: true)
        }
      }
    end
  end

  describe 'GET /api/v1/specialties' do
    path '/api/v1/specialties' do
      get('list specialties') do
        response(200, 'successful') do
          include_context 'response content example'
        end
      end
    end
  end

  describe 'POST /api/v1/specialties' do
    path '/api/v1/specialties' do
      post('create specialty') do
        response(200, 'successful') do
          include_context 'response content example'
        end
      end
    end
  end

  describe 'GET /api/v1/specialties/{id}' do
    path '/api/v1/specialties/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'
      get('show specialty') do
        response(200, 'successful') do
          let(:id) { '123' }
          include_context 'response content example'
        end
      end
    end
  end
end

RSpec.describe 'Api::v1::Doctors', type: :request do
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
    @specialty = Specialty.create(name: 'Dentistry', doctor_id: @doctor.id)
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/api/v1/specialties'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
