# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'void_logger'

Gem::Specification.new do |spec|
  spec.name          = "void_logger"
  spec.version       = VoidLogger::VERSION
  spec.authors       = ["Denis Jean"]
  spec.email         = ["denis.jean@ecairn.com"]
  spec.summary       = %q{VoidLogger is a logger that logs to nothing.}
  spec.description   = ""
  spec.homepage      = "https://github.com/ecairn/void_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5"
end
