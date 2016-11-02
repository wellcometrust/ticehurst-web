module ApplicationHelper


  def image_path(image_id, width, height)
    "https://dlcs.io/iiif-img/2/1/#{image_id}/full/!#{width},#{height}/0/default.jpg"
  end


  def cropped_image_path(image_id, width, height, x, y, crop_width, crop_height)
    "https://dlcs.io/iiif-img/2/1/#{image_id}/pct:#{x},#{y},#{crop_width},#{crop_height}/!#{width},#{height}/0/default.jpg"
  end

  def stay_date(date, date_string)

    if date
      date.strftime("%e %b %Y")
    else
      date_string
    end

  end

end
