module StrongLocals
  class Locals
    attr_accessor :locals, :local_assigns, :errors

    DEFAULT_OPTIONS = {
      required: true,
      presence: true
    }.freeze

    def self.register(key, klass)
      @@validators ||= {}
      @@validators[key] = klass
    end

    def self.validators
      @@validators ||= {}
      @@validators
    end

    register :required,   Validation::Required
    register :presence,   Validation::Presence
    register :numeric,    Validation::Numeric
    register :collection, Validation::Collection
    register :model,      Validation::Model

    def self.add(*args)
      new.add(*args)
    end

    def initialize
      @locals = {}
      @local_assigns = {}
      @errors = {}
    end

    def add(*args)
      field, options = args
      locals[field] = options
      self
    end

    def validate(local_assigns)
      @local_assigns = local_assigns

      locals.each do |field, options|
        options = DEFAULT_OPTIONS.merge(options || {})
        options.each do |validator_key, validation_options|
          klass = validators[validator_key]
          next unless klass
          validator = klass.new(local_assigns, field, validation_options)
          add_error(field, validator.message) unless validator.valid?
        end
      end

      errors
    end

    def validate!(local_assigns)
      validate(local_assigns)
      report_errors!
    end

    private

    def validators
      self.class::validators
    end

    def add_error(field, message)
      self.errors[field] ||= []
      self.errors[field] << message
    end

    def report_errors!
      fail LocalsException, errors if errors.size > 0
    end
  end
end
