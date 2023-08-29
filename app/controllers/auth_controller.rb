class AuthController < ApplicationController
  skip_before_action :require_login, only: %i[login auto_login]

  def login
    user = User.find_by(username: params[:username])

    # Debugging output
    puts "User found: #{user.inspect}" if user

    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)

      # Debugging output
      puts "Login successful for user: #{user.username}"

      render json: { user:, jwt: token, success: "Welcome back, #{user.username}" }
    else
      # Debugging output
      puts "Login failed for user: #{params[:username]}"

      render json: { failure: 'Log in failed! Username or password invalid!' }
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: { errors: 'No User Logged In' }
    end
  end

  def user_is_authed
    render json: { message: 'You are authorized' }
  end
end
