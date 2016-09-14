
module YDF

  module Convert

    class Document

      def initialize(properties)
        @properties = properties
        @features = []
      end

      def to_s
        return @features.join("\n")
      end

      attr_reader :properties
      attr_accessor :features
    end

  end
end

