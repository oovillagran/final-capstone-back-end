require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  shared_examples 'successful_response' do
    after do |example|
      example.metadata[:response][:content] = {
        'application/json' => {
          example: JSON.parse(response.body, symbolize_names: true)
        }
      }
    end
  end

  path '/api/v1/doctors' do
    get('list doctors') do
      response(200, 'successful') do
        include_examples 'successful_response'
      end
    end

    post('create doctor') do
      response(200, 'successful') do
        include_examples 'successful_response'
      end
    end
  end

  path '/api/v1/doctors/new' do
    get('new doctor') do
      response(200, 'successful') do
        include_examples 'successful_response'
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    %w[get patch put delete].each do |http_method|
      operation_description = "#{http_method.capitalize} doctor"

      send(http_method, operation_description) do
        response(200, 'successful') do
          let(:id) { '123' }
          include_examples 'successful_response'
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
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/api/v1/doctors'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
