# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fuzzy_io/version'

Gem::Specification.new do |spec|
  spec.name          = "fuzzy_io"
  spec.version       = FuzzyIo::VERSION
  spec.authors       = ["Evan Prodromou"]
  spec.email         = ["evan@fuzzy.io"]
  spec.summary       = %q{Interface to the fuzzy.io REST API}
#  spec.description   = %q{}
  spec.homepage      = "https://fuzzy.io/docs#ruby"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
