module StrongLocals
  module Validation
    class Base
      attr_accessor :local_assigns, :field, :options

      def initialize(local_assigns, field, options)
        @local_assigns = local_assigns
        @field = field
        @options = options
      end

      def valid?
        raise "Must be defined by child"
      end

      def exists?
        local_assigns.keys.include?(field)
      end

      def value
        local_assigns[field]
      end

      def message
        self.class::MESSAGE
      end
    end
  end
end
