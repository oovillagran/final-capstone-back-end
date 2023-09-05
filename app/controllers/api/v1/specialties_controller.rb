class Api::V1::SpecialtiesController < ApplicationController
  before_action :set_specialty, only: %i[show destroy]

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
      render json: @specialty, status: :created
    else
      render json: @specialty.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @specialty = Specialty.find_by(id: params[:id])

    if @specialty
      if @specialty.destroy
        render json: { message: 'Specialty successfully destroyed' }, status: :ok
      else
        render json: { error: 'Failed to destroy the specialty' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Specialty not found' }, status: :not_found
    end
  end

  private

  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(:name, :doctor_id)
  end
end
