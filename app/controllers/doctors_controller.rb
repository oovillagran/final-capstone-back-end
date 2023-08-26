class DoctorsController < ApplicationController

  # GET /doctors
  def index
    @doctors = Doctor.all
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

    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: unprocesable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
  end

  def doctor_params
    params.require(:doctor).permit(:name, :photo, :bio, :experience_years, )
  end
end
