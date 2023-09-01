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
    run_test!
  end

  path '/api/v1/clinics' do
    get('list clinics') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = response_content_example
        end
        run_test!
      end
    end

    post('create clinic') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = response_content_example
        end
        run_test!
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
          run_test!
        end
      end
    end
  end
end
