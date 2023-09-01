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
          run_test!
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
          run_test!
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
          run_test!
        end
      end
    end
  end
end
