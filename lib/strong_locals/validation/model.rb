module StrongLocals
  module Validation
    class Model < Base
      MESSAGE = 'not model'.freeze

      def valid?
        return true unless options
        value.is_a?(::ActiveRecord::Base)
      end
    end
  end
end
