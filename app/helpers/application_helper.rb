module ApplicationHelper


  def image_path(image_id, width, height)
    "https://dlcs.io/iiif-img/2/1/#{image_id}/full/!#{width},#{height}/0/default.jpg"
  end

end
