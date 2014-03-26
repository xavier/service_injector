# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_injector/version'

Gem::Specification.new do |spec|
  spec.name          = "service_injector"
  spec.version       = ServiceInjector::VERSION
  spec.authors       = ["Xavier Defrang"]
  spec.email         = ["xavier.defrang@gmail.com"]
  spec.summary       = %q{Simple service injector. WIP.}
  spec.description   = %q{Simple service injector. WIP.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
