class Image < ApplicationRecord

  belongs_to :record
  has_many :case_notes

  def label

    if left_page || right_page
      "#{left_page.to_s.upcase} – #{right_page.to_s.upcase}"
    elsif page_type
      page_type
    else
      "-"
    end

  end

end
