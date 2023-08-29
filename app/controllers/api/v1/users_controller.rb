class Api::V1::UsersController < ApplicationController
  before_action :authorized

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end
end

# Swagger Annotations
swagger_path '/users' do
  operation :get do
    key :summary, 'Fetch a list of users'
    key :tags, ['users']
    response 200 do
      key :description, 'List of users'
      schema do
        key :type, :array
        items do
          key :$ref, :User
        end
      end
    end
  end
end

swagger_path '/users/{id}' do
  operation :get do
    key :summary, 'Fetch a user by ID'
    key :tags, ['users']
    parameter do
      key :name, :id
      key :in, :path
      key :description, 'User ID'
      key :required, true
      key :type, :integer
    end
    response 200 do
      key :description, 'User response'
      schema do
        key :$ref, :User
      end
    end
  end
end
