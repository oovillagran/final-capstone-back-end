class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login, :destroy]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  #LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @user
  end

  # Logout
  def destroy
    render json: { message: "Logged out successfully"}
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :phone_number, :birthdate, :role, :username, :email, :password)
  end
end
