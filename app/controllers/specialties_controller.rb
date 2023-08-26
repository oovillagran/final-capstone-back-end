class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
    render json: @specialtiesg
  end
end
