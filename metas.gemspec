# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metas/version'

Gem::Specification.new do |spec|
  spec.name          = "metas"
  spec.version       = Metas::VERSION
  spec.authors       = ["Matheus Cáceres"]
  spec.email         = ["matheuscaceres@gmail.com", "hugodemiglio@gmail.com"]
  spec.summary       = %q{Wouldn't leave their focus, create metas!}
  spec.description   = %q{A gem to create meta tags easy!}
  spec.homepage      = "https://github.com/formaweb/metas"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", '>= 4.0.0', '< 4.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 10.1.1'
  spec.add_development_dependency "rspec", "~> 3.0.0.beta2"
  spec.add_development_dependency "capybara", '~> 2.2.0'
end