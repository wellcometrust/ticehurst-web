class RecordsController < ApplicationController


  def index
    @records = Record.order(:volume_number)
      .joins(:images)
      .group('records.id')
      .select('records.*, count(images.id) as images_count')
  end

  def show
    @record = Record.find(params[:id])
    @images = @record.images.order(:sequence)
  end

  def pages
    @record = Record.find(params[:record_id])
    @images = @record.images.order(:sequence)
  end

  def update_pages

    record = Record.find(params[:record_id])

    images = record.images

    params[:page].each_pair do |page, values|

      image = images.detect {|image| image.sequence == page.to_i }

      if values['left'].present?
        image.left_page = values['left']
      end

      if values['right'].present?
        image.right_page = values['right']
      end

      if values['type'].present?
        image.page_type = values['type']
      end

      image.save!

    end

    record.update_pages_with_type_count!

    redirect_to record_path(record)
  end

end
