require 'open-uri'
require 'json'

class Record < ApplicationRecord

  has_many :images


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

end
