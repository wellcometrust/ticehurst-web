class Patient < ApplicationRecord

  has_many :stays
  has_many :case_notes

  def update_dates!

    self.first_admitted ||= stays.order(:admission).first.try(:admission)
    self.last_discharged ||= stays.order(:discharge).last.try(:discharge)
    save!

  end

  def update_length_of_stays!

    length = 0

    stays.each do |stay|

      if stay.admission && stay.discharge
        length += (stay.discharge - stay.admission) + 1
      end

    end

    if length > 0

      self.length_of_stays = length
      self.save!
    end



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
