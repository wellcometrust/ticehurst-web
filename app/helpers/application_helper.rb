module ApplicationHelper


  def image_path(image_id, width, height)
    "https://dlcs.io/iiif-img/2/1/#{image_id}/full/!#{width},#{height}/0/default.jpg"
  end


  def cropped_image_path(image_id, width, height, x, y, crop_width, crop_height)
    "https://dlcs.io/iiif-img/2/1/#{image_id}/pct:#{x},#{y},#{crop_width},#{crop_height}/!#{width},#{height}/0/default.jpg"
  end

  def spine_image_path(record_id, image_id)

    if record_id == "b19095879"
      cropped_image_path(image_id, 300, 200, 45, 2, 20, 96)
    elsif record_id == "b18877047" || record_id == "b18904099"
      cropped_image_path(image_id, 300, 200, 0, 2, 100, 96)
    else
      cropped_image_path(image_id, 300, 200, 30, 2, 50, 96)
    end

  end

  def stay_date(date, date_string)

    if date
      date.strftime("%e %b %Y")
    else
      date_string
    end

  end

end
