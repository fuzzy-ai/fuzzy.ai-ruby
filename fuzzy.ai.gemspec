# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fuzzy.ai/version'

Gem::Specification.new do |spec|
  spec.name          = 'fuzzy.ai'
  spec.version       = FuzzyAi::VERSION
  spec.authors       = ['Evan Prodromou', 'James Walker']
  spec.email         = ['evan@fuzzy.ai']
  spec.summary       = 'Interface to the fuzzy.ai REST API'
  spec.description   = 'Interface to the fuzzy.ai REST API'
  spec.homepage      = 'https://fuzzy.ai/docs/sdk/ruby'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
