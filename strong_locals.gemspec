$:.push File.expand_path("../lib", __FILE__)

require "strong_locals/version"

Gem::Specification.new do |s|
  s.name        = "strong_locals"
  s.version     = StrongLocals::VERSION
  s.authors     = ["Leigh Halliday"]
  s.email       = ["leighhalliday@gmail.com"]
  s.homepage    = "https://github.com/leighhalliday/strong_locals"
  s.summary     = "StrongLocals is a gem for verifying the local variables passed to partials."
  s.description = "StrongLocals is a gem for verifying the local variables passed to partials."
  s.license     = "MIT"

  s.test_files = Dir["spec/**/*"]

  # Dependencies
  s.add_dependency 'rails', '>= 4.0'

  # Dev Dependencies
end
