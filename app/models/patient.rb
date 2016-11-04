class Patient < ApplicationRecord

  has_many :stays
  has_many :case_notes

  def update_dates!

    self.first_admitted ||= stays.order(:admission).first.try(:admission)
    self.last_discharged ||= stays.order(:discharge).last.try(:discharge)
    save!

  end

  def years_string

    start_year = first_admitted.try(:year)
    end_year = last_discharged.try(:year)

    if start_year || end_year

      if start_year != end_year
        "#{start_year}-#{end_year}"
      else
        start_year.to_s
      end

    end


  end

end
