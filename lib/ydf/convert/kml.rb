require "rexml/document"

module YDF

  module Convert

    class KML

      def parse(kml)

        xmldoc = REXML::Document.new(kml)

        d = xmldoc.get_elements("kml/Document")
        h = element_to_hash(d[0])
        c = d[0].get_elements("Placemark/LineString/coordinates")
        properties = h

        lineString = createLineString(c[0].get_text.value)
        feature = YDF::Convert::Feature.new(lineString, {})
        doc = YDF::Convert::Document.new(properties)
        doc.features.push(feature)

        return doc
      end

      def createLineString(coordinates)
        points = []
        coordinates.split("\n").each{|line|
          if line.strip != ""
            ll = line.split(',')
            p = Point.new(ll[1], ll[0])
            points.push(p)
          end
        }
        return YDF::Convert::LineString.new(points)
      end

      def element_to_hash(element)
        h = {}
        element.elements.each{|e|
          h[e.name] = e.text
        }
        return h
      end
  
    end

  end  
end
