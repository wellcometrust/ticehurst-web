class PatientsController < ApplicationController


  def index

    @name_search = params[:name]
    @name_search = nil if params[:name].blank?

    stays = Stay.joins(:patient)
      .select('patients.*, stays.*')


    case params[:order].to_s
    when "admission"
      stays = stays.order('patients.highlighted desc', 'patients.first_admitted')
    when "discharged"
      stays = stays.order('patients.highlighted desc', 'patients.last_discharged')
    else
      stays = stays.order('patients.highlighted desc', 'patients.name', 'stays.admission')
    end

    if @name_search
      stays = stays.where("lower(patients.name) LIKE ?", "%#{@name_search.downcase}%")
    end

    @patients = stays.group_by(&:patient_id)


  end

  def show
    @patient = Patient.find(params[:id])
    @stays = @patient.stays.order(:admission)

    @case_notes = @patient.case_notes
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
