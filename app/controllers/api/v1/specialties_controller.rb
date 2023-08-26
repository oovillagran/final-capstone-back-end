class Api::V1::SpecialtiesController < ApplicationController
  before_action :set_specialty, only: [:show, :destroy]

  def index
    @specialties = Specialty.all
    render json: @specialties
  end

  def show
    render json: @specialty
  end
  
  def create
    @specialty = Specialty.new(specialty_params)

    if @specialty.save
      render json: @specialty, status: :created, location: @specialty
    else
      render json: @specialty.errors, status: :unprocesable_entity
    end
  end

  def destroy
    @specialty.destroy
  end

  private
  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(:name, :doctor_id)
  end
end
