class CaseNote < ApplicationRecord

  belongs_to :stay
  belongs_to :record
  belongs_to :patient
  belongs_to :index_image, class_name: :Image

end
