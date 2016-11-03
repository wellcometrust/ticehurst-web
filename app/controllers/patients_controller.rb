class PatientsController < ApplicationController


  def index

    @name_search = params[:name]
    @name_search = nil if params[:name].blank?

    @stays = Stay.joins(:patient)
      .select('patients.*, stays.*')
      .order('patients.highlighted desc', 'patients.name', 'stays.admission')

    if @name_search
      @stays = @stays.where("lower(patients.name) LIKE ?", "%#{@name_search.downcase}%")
    end

  end

  def show
    @patient = Patient.find(params[:id])
    @stays = @patient.stays.order(:admission)
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    introduction = params[:patient][:introduction]

    if introduction

      if !introduction.blank?
        @patient.introduction = introduction
      else
        @patient.introduction = nil
      end
    end

    @patient.save!
    redirect_to patient_path(@patient)

  end

end
