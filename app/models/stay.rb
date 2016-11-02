class Stay < ApplicationRecord

  belongs_to :patient, counter_cache: true

  has_one :admission_certificate
  has_many :case_notes
  has_one :discharge_note
  has_many :bill_notes


  def set_dates_from_transcribed!

    date_regex = /\A\d+\s[A-Z][a-z]{2}\.?\s\d{4}\z/

    if admission.nil? && transcribed_date_of_admission =~ date_regex
      self.admission = Date.parse(transcribed_date_of_admission)
    end

    if discharge.nil? && transcribed_date_of_discharge =~ date_regex
      self.discharge = Date.parse(transcribed_date_of_discharge)
    end

    save!


  end

end
