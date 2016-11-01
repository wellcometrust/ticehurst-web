class Stay < ApplicationRecord

  belongs_to :patient, counter_cache: true

  has_one :admission_certificate

end
