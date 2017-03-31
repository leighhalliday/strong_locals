module StrongLocals
  module Validation
    class Numeric < Base
      MESSAGE = 'not numeric'.freeze

      def valid?
        return true unless options
        Float(value) != nil rescue false
      end
    end
  end
end
