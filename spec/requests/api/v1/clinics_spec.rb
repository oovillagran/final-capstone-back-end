require 'swagger_helper'

RSpec.describe 'api/v1/clinics', type: :request do
  shared_examples 'successful_response' do
    after do |example|
      example.metadata[:response][:content] = {
        'application/json' => {
          example: JSON.parse(response.body, symbolize_names: true)
        }
      }
    end
  end

  path '/api/v1/clinics' do
    get('list clinics') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = response_content_example
        end
      end
    end

    post('create clinic') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = response_content_example
        end
      end
    end
  end

  path '/api/v1/clinics/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    %w[get patch put delete].each do |http_method|
      operation_description = "#{http_method.capitalize} clinic"

      send(http_method, operation_description) do
        response(200, 'successful') do
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = response_content_example
          end
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
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/api/v1/clinics'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
