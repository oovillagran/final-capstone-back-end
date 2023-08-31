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
    run_test!
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
