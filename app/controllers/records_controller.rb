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

  def index_pages
    @record = Record.find(params[:record_id])
    @images = @record.images.where(page_type: 'Index').order(:sequence)
    @transcribed_images = @images.select(&:transcribed).length
  end

  def index_page
    @record = Record.find(params[:record_id])
    @image = @record.images.find(params[:id])

    @case_notes = @record.case_notes.where(index_image: @image)

    @patients = Patient.order(:name)
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


  def update_index_page
    record = Record.find(params[:record_id])
    image = record.images.find(params[:id])

    image.transcribed = params[:image][:transcribed]
    image.save!

    params[:index_ref].each do |index_ref|

      if index_ref[:patient_id].present? && index_ref[:page_ref].present? && index_ref[:index_side].present?

        patient = Patient.find(index_ref[:patient_id])

        index_ref[:page_ref].to_s.split(',').each do |page_number|

          start_page_image =
            record.images.where(left_page: page_number).order(:sequence).first ||
            record.images.where(right_page: page_number).order(:sequence).first

          case_note = record.case_notes.new
          case_note.index_image = image
          case_note.patient = patient


          if start_page_image
            case_note.sequence_start = start_page_image.sequence
            case_note.sequence_end = start_page_image.sequence
          end

          case_note.transcribed_index_page_ref = page_number
          case_note.index_side = index_ref[:index_side]
          case_note.save!

        end

      end


    end


    next_image = record.images.find_by(sequence: image.sequence + 1)


    if params[:next].to_s == "reload"
      redirect_to record_index_page_path(record, image.id)

    else
      if next_image.page_type == 'Index'
        redirect_to record_index_page_path(record, next_image.id)
      else
        redirect_to record_index_path(record)
      end
    end
  end

end
