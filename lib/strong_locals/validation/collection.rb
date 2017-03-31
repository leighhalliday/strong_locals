module StrongLocals
  module Validation
    class Collection < Base
      MESSAGE = 'not collection'.freeze

      def valid?
        return true unless options
        value.respond_to?(:each)
      end
    end
  end
end
