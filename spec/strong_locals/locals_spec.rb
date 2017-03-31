require 'spec_helper'
require 'strong_locals'

RSpec.describe StrongLocals::Locals do
  it 'adds locals' do
    locals = StrongLocals::Locals.add(:name).add(:age)
    expect(locals.locals.keys).to eq([:name, :age])
  end

  it 'validates required' do
    local_assigns = {name: 'Leigh'}
    locals = StrongLocals::Locals.
      add(:name, required: true).
      add(:age, required: true)

    expect(locals.validate(local_assigns)).to eq({
      age: ["required", "not present"]
    })
  end

  it 'validates presence' do
    local_assigns = {name: nil, age: nil}
    locals = StrongLocals::Locals.
      add(:name, required: true).
      add(:age, required: true, presence: false)

    expect(locals.validate(local_assigns)).to eq({
      name: ["not present"]
    })
  end

  it 'validates collection' do
    local_assigns = {names: [], ages: 10}
    locals = StrongLocals::Locals.
      add(:names, collection: true).
      add(:ages, collection: true)

    expect(locals.validate(local_assigns)).to eq({
      ages: ["not collection"]
    })
  end

  it 'validates model' do
    module ActiveRecord
      class Base
      end
    end

    class Alpaca < ActiveRecord::Base
    end

    local_assigns = {alpaca: Alpaca.new, llama: 'Spitty'}
    locals = StrongLocals::Locals.
      add(:alpaca, model: true).
      add(:llama, model: true)

    expect(locals.validate(local_assigns)).to eq({
      ages: ["not model"]
    })
  end

  it 'validates numeric' do
    local_assigns = {eyes: 2, age: 'Old'}
    locals = StrongLocals::Locals.
      add(:eyes, numeric: true).
      add(:age, numeric: true)

    expect(locals.validate(local_assigns)).to eq({
      name: ["not numeric"]
    })
  end

  it 'raises exception' do
    local_assigns = {name: 'Leigh'}
    locals = StrongLocals::Locals.
      add(:name).
      add(:age)

    expect {
      locals.validate!(local_assigns)
    }.to raise_error(StrongLocals::LocalsException)
  end
end
