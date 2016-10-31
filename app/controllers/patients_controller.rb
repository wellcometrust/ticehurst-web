class PatientsController < ApplicationController


  def index

    @name_search = params[:name]
    @name_search = nil if params[:name].blank?

    if !@name_search
      @patients = Patient.order(:name)
    else
      @patients = Patient.where("lower(name) LIKE ?", "%#{@name_search.downcase}%")
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

end
