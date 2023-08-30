require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    it 'creates a new user' do
      post '/users', params: { user: {
        first_name: 'Eric',
        last_name: 'Antwi',
        birthdate: Date.parse('30-09-2001'),
        role: 'user',
        phone_number: '+233206546917',
        username: 'Mylo16',
        email: 'ericopokuantwi384@gmail.com',
        password: '123456'
      } }
      expect(response).to have_http_status(:created)
    end
  end
end
