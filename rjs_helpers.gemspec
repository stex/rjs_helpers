# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rjs_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'rjs_helpers'
  spec.version       = RjsHelpers::VERSION
  spec.authors       = ['Stefan Exner']
  spec.email         = ['stexmedia@googlemail.com']
  spec.description   = %q{Some helper methods to perform standard JS library tasks from js.erb without having to write actual javascript}
  spec.summary       = %q{Some helper methods to perform standard JS library tasks from js.erb without having to write actual javascript}
  spec.homepage      = 'https://github.com/Stex/rjs_helpers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 3.2', '< 5.2'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '0.9.2.2'
  spec.add_development_dependency 'barista'
end
