module StrongLocals
  module Validation
    class Presence < Base
      MESSAGE = 'not present'.freeze

      def valid?
        return true unless options
        value ? true : false
      end
    end
  end
end
