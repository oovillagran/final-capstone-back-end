class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
    render json: @specialties
  end

  
end
