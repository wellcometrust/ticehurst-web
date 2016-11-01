class DischargeNote < ApplicationRecord

  belongs_to :stay
  belongs_to :record

end
