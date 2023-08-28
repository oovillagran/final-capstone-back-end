class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception

  # before_action :update_allowed_parameters, if: :devise_controller?

  # protected

  # def update_allowed_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |u|
  #     u.permit(:first_name, :last_name, :username, :birthdate, :email, :password)
  #   end
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:first_name, :last_name, :username, :email, :password, :current_password)
  #   end
  # end
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split[1]
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless
    logged_in?
  end
end
