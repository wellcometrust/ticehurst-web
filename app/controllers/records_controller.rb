class RecordsController < ApplicationController


  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
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

    redirect_to record_path(record)
  end

end
