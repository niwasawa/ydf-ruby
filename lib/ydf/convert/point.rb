
module YDF

  module Convert

    class Point

      def initialize(lat, lon)
        @lat = lat
        @lon = lon
      end

      def to_s
        return "lat=#{@lat}, lon=#{@lon}"
      end

      attr_accessor :lat, :lon
    end

  end
end

