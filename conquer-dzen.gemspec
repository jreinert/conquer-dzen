# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conquer/dzen/version'

Gem::Specification.new do |spec|
  spec.name          = "conquer-dzen"
  spec.version       = Conquer::Dzen::VERSION
  spec.authors       = ["Joakim Reinert"]
  spec.email         = ["mail@jreinert.com"]

  spec.summary       = 'Dzen plugin for conquer'
  spec.description   = 'Adds dzen helpers to conquer'
  spec.homepage      = 'https://github.com/jreinert/conquer-dzen'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'conquer', '~> 0.1'
end
