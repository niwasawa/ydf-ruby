require "rexml/document"

module YDF

  module Convert

    class YDFXML
  
      def generate(doc, option={})
  
        id = doc.properties['id']
        name = doc.properties['name']
        description = doc.properties['description']
        
        out = REXML::Document.new()
        out.add(REXML::XMLDecl.new(version="1.0",  encoding="UTF-8"))
          
        out_ydf = REXML::Element.new("YDF")
        out_ydf.add_attributes({
          "xmlns" => "http://olp.yahooapis.jp/ydf/1.0"
        })
        out.add_element(out_ydf)
  
        out_ydf.add_element(createYdfResultInfo(doc))
  
        doc.features.each{|feature|
          f = createYdfLineStringFeature(feature)
          out_ydf.add_element(f)
        }
   
        output = ""
        out.write(output: output, indent: -1, transitive: false, ie_hack: false)
          
        return output
      end
  
      def createYdfResultInfo(doc)
        ri = REXML::Element.new("ResultInfo")
        ri.add_element(REXML::Element.new("Status").add_text("200"))
        ri.add_element(REXML::Element.new("Count").add_text(doc.features.size().to_s()))
        return ri
      end
  
      def createYdfLineStringFeature(feature)
  
        id = feature.properties['id']
        name = feature.properties['name']
        description = feature.properties['description']
        coordinates = createYdfCoordinates(feature.geometry)
  
        out_feature = REXML::Element.new("Feature")
  
        REXML::Element.new("Id", out_feature).add_text(id) if id
        REXML::Element.new("Name", out_feature).add_text(name) if name
        REXML::Element.new("Description", out_feature).add_text(description) if description
          
        out_geometry = REXML::Element.new("Geometry", out_feature)
        REXML::Element.new("Type", out_geometry).add_text("linestring")
        REXML::Element.new("Coordinates", out_geometry).add_text(coordinates)
  
        #out_style= createYdfStyle()
        #out_feature.add_element(out_style)
  
        #out_style = REXML::Element.new("Style", out_feature)
        #REXML::Element.new("Type", out_style).add_text("line")
        #REXML::Element.new("Size", out_style).add_text("3")
        #REXML::Element.new("Opacity", out_style).add_text("50")
        #REXML::Element.new("Color", out_style).add_text("0000ff")
        #REXML::Element.new("EndLine", out_style).add_text("arrow")
        #REXML::Element.new("StartLine", out_style).add_text("arrow")
  
        return out_feature
      end
  
      def createYdfStyle()
        out_style = REXML::Element.new("Style")
        REXML::Element.new("Type", out_style).add_text("line")
        REXML::Element.new("Size", out_style).add_text("3")
        REXML::Element.new("Opacity", out_style).add_text("50")
        REXML::Element.new("Color", out_style).add_text("0000ff")
        REXML::Element.new("EndLine", out_style).add_text("arrow")
        REXML::Element.new("StartLine", out_style).add_text("arrow")
        return out_style
     end
  
      def createYdfCoordinates(lineString)
        c = []
        lineString.points.each{|p|
          c.push("#{p.lon},#{p.lat}")
        }
        return c.join(" ")
      end
  
      def parse(xml)
      end
    end

  end
  
end  
  