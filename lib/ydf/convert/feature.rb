
module YDF

  module Convert

    class Feature

      def initialize(geometry, properties)
        @geometry = geometry
        @properties = properties
      end

      def to_s
        return "#{@properties}: #{@geometry}"
      end

      attr_accessor :geometry, :properties
    end

  end
end

