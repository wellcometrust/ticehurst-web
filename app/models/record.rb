require 'open-uri'
require 'json'

class Record < ApplicationRecord

  has_many :images


  def volume=(volume_string)
    puts "Volume: #{volume_string}"
    write_attribute(:volume, volume_string)
    write_attribute(:volume_number,volume_string.to_i) if volume_string =~ /\A\d+\z/
  end

  def update_images

    file = open("http://wellcomelibrary.org/iiif/#{id}/manifest").read

    json = JSON.parse(file)

    json['sequences'][0]['canvases'].each_with_index do |canvas, index|

      width = canvas.fetch('width')
      height = canvas.fetch('height')

      image_id = canvas['images'].first['@id'].gsub("http://wellcomelibrary.org/iiif/#{id}/imageanno/", '')


      image = images.find_or_initialize_by(id: image_id)
      image.width = width
      image.height = height
      image.sequence = index + 1
      image.save!


    end


  end

  def update_pages_with_type_count!
    self.pages_with_type = images.where.not(page_type: nil).count
    save!
  end

end
