class SpecialtiesController < ApplicationController
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @specialties = Specialty.where(doctor_id: @doctor)
    render json: @specialties
  end
end
