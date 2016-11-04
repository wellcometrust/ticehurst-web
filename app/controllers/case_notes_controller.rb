class CaseNotesController < ApplicationController

  def show
    @case_note = CaseNote.find(params[:id])
  end

  def destroy
    case_note = CaseNote.find(params[:id])
    record = case_note.record
    index_image = case_note.index_image

    case_note.destroy


    if index_image
      redirect_to record_index_page_path(record, index_image.id)
    else
      redirect_to record_index_path(record)
    end

  end

end
