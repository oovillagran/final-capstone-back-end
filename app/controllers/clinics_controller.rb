class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all
    render json: @clinics
  end
end
