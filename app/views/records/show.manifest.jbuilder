json.label "Ticehurst Case Book Volume #{@record.volume}"

json.set! "@id", "https://wellcome-ticehurst.herokuapp.com/iiif/#{@record.id}/manifest"
json.set! "@type", "sc:Manifest"
json.set! "@context", "http://iiif.io/api/presentation/2/context.json"

json.sequences [0] do


  json.canvases @images do |image|

    json.set! "@id", "http://wellcomelibrary.org/iiif/#{@record.id}/canvas/c#{image.sequence}"
    json.label image.label

    json.images [0] do

      json.resource do

        json.set! "@id", "https://dlcs.io/iiif-img/2/1/#{image.id}/full/!1024,1024/0/default.jpg"

        json.service do

          json.set! "@id", "https://dlcs.io/iiif-img/2/1/#{image.id}"

        end

      end

    end

  end


end