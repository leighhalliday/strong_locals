# StrongLocals

Methods have signatures, React has PropTypes, but Rails partials don't provide a way to declare what local variables they expect to receive. `StrongLocals` aims to help with that, by providing validations for the incoming locals to the partial.

## Example Usage

In HAML:

```ruby
:ruby
  StrongLocals.
    add(:currency).
    add(:campaign, presence: false).
    validate!(local_assigns)
```

In ERB:

```erb
<%
StrongLocals.
  add(:currency).
  add(:campaign, presence: false).
  validate!(local_assigns)
%>
```

If the locals passed to the partial don't pass the validation, a `StrongLocals::LocalsException` exception will be raised which contains the error information.

## Creating Custom Validations

First define a validation class which extends from `StrongLocals::Validations::Base`.
It should contain a `MESSAGE` and a `valid?` method which checks to confirm that the
value being validated conforms to the validation.

```ruby
class StringValidation < StrongLocals::Validations::Base
  MESSAGE = 'not string'.freeze

  def valid?
    value.respond_to?(:to_s)
  end
end
```

Next, register your new validation so that `StrongLocals` knows about it.

```ruby
StrongLocals::Locals.register :string, StringValidation
```
