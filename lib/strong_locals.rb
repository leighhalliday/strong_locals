module StrongLocals
  def self.add(*args)
    Locals.add(*args)
  end
end

# Validations
require 'strong_locals/validation/base'
require 'strong_locals/validation/collection'
require 'strong_locals/validation/model'
require 'strong_locals/validation/numeric'
require 'strong_locals/validation/presence'
require 'strong_locals/validation/required'

# Exceptions
require 'strong_locals/locals_exception'

# Classes
require 'strong_locals/locals'
