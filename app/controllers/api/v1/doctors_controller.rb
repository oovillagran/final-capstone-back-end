class Api::V1::DoctorsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_doctor, only: %i[show destroy update]

  # GET /doctors
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  # GET /doctors/1
  def show
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
    @doctor.destroy
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :photo, :bio, :experience_years, :user_id)
  end
end
