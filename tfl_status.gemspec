# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tfl_status/version'

Gem::Specification.new do |spec|
  spec.name          = "tfl_status"
  spec.version       = TflStatus::VERSION
  spec.authors       = ["Nicholas Jones"]
  spec.email         = ["me@nicholasjon.es"]
  spec.summary       = "A very basic TFL line status checker."
  spec.homepage      = "https://github.com/nick-jones/tfl_status"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
