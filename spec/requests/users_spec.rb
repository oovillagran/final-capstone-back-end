require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          first_name: 'kola',
          last_name: 'kolade',
          phone_number: '137373737',
          birthdate: '2000-08-31',
          username: 'kkolade',
          email: 'kolakolade@gmail.com',
          password: '123456'
        }
      end

      it 'creates a new user' do
        post :create, params: valid_params
        expect(response).to have_http_status(:ok)
      end
      it 'returns a JWT token on successful creation' do
        post :create, params: valid_params
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body).to have_key('jwt')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          first_name: 'kola',
          last_name: 'kolade'
        }
      end

      it 'returns an error with invalid parameters' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:not_acceptable)
        body = JSON.parse(response.body)
        expect(body).to have_key('errors')
      end
    end
  end
end
