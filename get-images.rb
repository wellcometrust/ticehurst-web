require 'open-uri'
require 'json'

record_id = 'b18877047'

file = open("http://wellcomelibrary.org/iiif/#{record_id}/manifest").read


json = JSON.parse(file)

image_ids = json['sequences'][0]['canvases'].collect {|c| c['images'].first['@id'].gsub('http://wellcomelibrary.org/iiif/b18877047/imageanno/', '') }

file = File.open("#{record_id}.json", "w")
file.write JSON.pretty_generate({"record_id" => record_id, "image_ids" => image_ids})
file.close
