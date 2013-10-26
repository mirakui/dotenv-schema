# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotenv-schema/version'

Gem::Specification.new do |spec|
  spec.name          = "dotenv-schema"
  spec.version       = Dotenv::SCHEMA_VERSION
  spec.authors       = ["Issei Naruta"]
  spec.email         = ["naruta@cookpad.com"]
  spec.description   = %q{Defines schema for dotenv}
  spec.summary       = %q{Defines schema for dotenv}
  spec.homepage      = "https://github.com/mirakui/dotenv-schema"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dotenv"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
