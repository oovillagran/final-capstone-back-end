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
          run_test!
        end
      end
    end
  end

  describe 'POST /api/v1/specialties' do
    path '/api/v1/specialties' do
      post('create specialty') do
        response(200, 'successful') do
          include_context 'response content example'
          run_test!
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
          run_test!
        end
      end
    end
  end

  # Similar refactoring for other HTTP methods and paths...
end
