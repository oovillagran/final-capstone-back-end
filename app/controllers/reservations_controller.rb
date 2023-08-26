class ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = Reservation.where(user_id: @user).order(created_at: :desc)
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end
end
