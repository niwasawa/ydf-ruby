
module YDF

  module Convert

    class LineString

      def initialize(points)
        @points = points
      end

      def to_s
        return @points.join(" ")
      end

      attr_accessor :points
    end
  end  
end

