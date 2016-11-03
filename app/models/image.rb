class Image < ApplicationRecord

  belongs_to :record
  has_many :case_notes

end
