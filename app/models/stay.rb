class Stay < ApplicationRecord

  belongs_to :patient, counter_cache: true

  has_one :admission_certificate
  has_many :case_notes
  has_one :discharge_note

end
