class RecordsController < ApplicationController


  def show
    @record = Record.find(params[:id])
  end

  def pages
    @record = Record.find(params[:record_id])
    @images = @record.images.order(:sequence)
  end

end
