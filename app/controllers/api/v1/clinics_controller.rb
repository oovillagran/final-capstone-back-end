class Api::V1::ClinicsController < ApplicationController
  before_action :set_clinic, only: %i[show update destroy]
  before_action :authorized

  def index
    @clinics = Clinic.all
    render json: @clinics
  end

  def show
    render json: @clinic
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.doctor = Doctor.find(params[:doctor_id]) # authorization?

    if @clinic.save
      render json: @clinic, status: :created
    else
      render json: @clinic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @clinic.update(clinic_params)
      render json: @clinic
    else
      render json: @clinic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @clinic.destroy
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :city, :address, :doctor_id)
  end
end
