json.label "Ticehurst Case Book Volume #{@record.volume}"

json.set! "@id", "https://wellcome-ticehurst.herokuapp.com/iiif/#{@record.id}/manifest"
json.set! "@type", "sc:Manifest"
json.set! "@context", "http://iiif.io/api/presentation/2/context.json"

json.sequences [0] do

  json.viewingHint "paged"
  json.set! "@id", "https://wellcome-ticehurst.herokuapp.com/iiif/#{@record.id}/sequence/s0"
  json.set! "@type", "sc:Sequence"


  json.canvases @images do |image|

    label = image.label

    patient_names = @case_notes.select {|c| c.sequence_start == image.sequence }.collect do |case_note|
      case_note.stay ? case_note.stay.patient.name : case_note.patient.name
    end

    if patient_names.length > 0
      label += " – #{patient_names.join(',')}"
    end

    json.set! "@id", "http://wellcomelibrary.org/iiif/#{@record.id}/canvas/c#{image.sequence}"
    json.set! "@type", "sc:Canvas"
    json.label label
    json.height image.height
    json.width image.width

    json.images [0] do

      json.set! "@type", "oa:Annotation"
      json.on "http://wellcomelibrary.org/iiif/#{@record.id}/canvas/c#{image.sequence}"

      json.resource do

        json.set! "@id", "https://dlcs.io/iiif-img/2/1/#{image.id}/full/!1024,1024/0/default.jpg"
        json.set! "@type", "dctypes:Image"

        json.service do

          json.set! "@context", "http://iiif.io/api/image/2/context.json"
          json.set! "@id", "https://dlcs.io/iiif-img/2/1/#{image.id}"
          json.profile "http://iiif.io/api/image/2/level1.json"

        end

      end

    end

  end


end