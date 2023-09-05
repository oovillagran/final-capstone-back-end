class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :set_user, only: %i[index create]

  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.order(created_at: :desc)
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: "Reservation was successfully destroyed" }, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :status, :doctor_id, :clinic_id)
  end
end
