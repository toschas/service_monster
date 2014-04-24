# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_monster/version'

Gem::Specification.new do |spec|
  spec.name          = "service_monster"
  spec.version       = ServiceMonster::VERSION
  spec.authors       = ["spiritbear"]
  spec.email         = ["sindap@customerlobby.com"]
  spec.description   = %q{Wrapper for the ServiceMonster API}
  spec.summary       = %q{Wrapper for the ServiceMonster API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rspec', '~> 2.4')
  spec.add_development_dependency('webmock', '~> 1.6')
end
