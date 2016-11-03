class Patient < ApplicationRecord

  has_many :stays
  has_many :case_notes

end
