class Api::V1::DoctorsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_doctor, only: %i[destroy update]

  # GET /doctors
  def index
    @doctors = Doctor.includes(:reservations).includes(:clinics).all
    render json: @doctors
  end

  # GET /doctors/1
  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = session_user

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH /doctors/1
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    if @doctor.user == session_user || (session_user && session_user.role == 'admin')
      @doctor.destroy
      render json: { message: 'Doctor deleted successfully' }, status: :ok
    else
      render json: { message: 'You don\'t have permission to delete this doctor' }, status: :forbidden
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :photo, :bio, :experience_years, :user_id)
  end
end
