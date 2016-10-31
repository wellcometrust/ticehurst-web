class Stay < ApplicationRecord

  belongs_to :patient, counter_cache: true

end
