lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "strong_locals/version"

Gem::Specification.new do |s|
  s.name         = "strong_locals"
  s.version      = StrongLocals::VERSION
  s.authors      = ["Leigh Halliday"]
  s.email        = ["leighhalliday@gmail.com"]
  s.homepage     = "https://github.com/leighhalliday/strong_locals"
  s.summary      = "StrongLocals is a gem for verifying the local variables passed to partials."
  s.description  = s.summary
  s.license      = "MIT"
  s.test_files   = Dir["spec/**/*"]
  s.require_path = "lib"

  # Dependencies
  s.add_dependency 'rails', '>= 4.0'
end
