require 'csv'

namespace :patient_notes do


  desc "Ingest Patient Notes from CSV files"
  task ingest: :environment do


    Dir.glob("#{File.dirname(__FILE__)}/../../patient-names/csv/page-*.csv") do |filepath|


      CSV.foreach(filepath, headers: true) do |row|

        patient_name = row['Patient Name'].strip

        patient = Patient.find_or_create_by!(name: patient_name)

        archives_ref = row['Archives Ref'].strip
        archives_ref = nil if archives_ref.blank?

        date_of_admission = row['Date of Admission'].strip
        date_of_admission = nil if date_of_admission.blank?

        date_of_discharge = row['Date of Discharge'].strip
        date_of_discharge = nil if date_of_discharge.blank?

        subsequent_condition = row['Subsequent Condition or Wherabouts'].strip
        subsequent_condition = nil if subsequent_condition.blank?

        page = row['Page Number'].to_i
        line = row['Line Number'].to_i

        stay = Stay.find_or_initialize_by(transcribed_page: page, transcribed_line: line)
        stay.patient = patient

        stay.transcribed_name = row['Patient Name'].strip
        stay.transcribed_archives_ref = archives_ref
        stay.transcribed_date_of_admission = date_of_admission
        stay.transcribed_date_of_discharge = date_of_discharge
        stay.transcribed_subsequent_condition = subsequent_condition

        stay.save!


      end

    end


  end


end
