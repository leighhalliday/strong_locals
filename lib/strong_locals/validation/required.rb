module StrongLocals
  module Validation
    class Required < Base
      MESSAGE = 'required'.freeze

      def valid?
        return true unless options
        exists?
      end
    end
  end
end
