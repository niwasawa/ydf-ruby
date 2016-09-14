require "ydf"
require 'open-uri'

def read(filepath)
  return open(filepath, &:read)
end

#filepath = "http://latlonglab.yahoo.co.jp/route/get?id=c929431b4a7b07546ff59b30f50aa951&format=kml"
filepath = "kml_linestring.kml"

kml = read(filepath)
puts kml

doc = YDF::Convert::KML.new().parse(kml)

ydf = YDF::Convert::YDFXML.new().generate(doc)
puts ydf

