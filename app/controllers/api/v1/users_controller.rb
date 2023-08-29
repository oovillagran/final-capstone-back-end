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
