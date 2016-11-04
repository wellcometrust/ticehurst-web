class CaseBooksController < ApplicationController

  def index
    @case_books = Record
      .where.not(volume_number: nil)
      .order(:volume_number)
      .joins(:images)
      .group('records.id')
      .select('records.*, count(images.id) as images_count')
  end

end
