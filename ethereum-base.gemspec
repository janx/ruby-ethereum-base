# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ethereum/base/version'

Gem::Specification.new do |spec|
  spec.name          = "ethereum-base"
  spec.version       = Ethereum::Base::VERSION
  spec.authors       = ["Jan Xie", "Steve Ellis"]
  spec.email         = ["jan.h.xie@gmail.com", "email@steveell.is"]

  spec.summary       = %q{Utilities for common Ethereum functions.}
  spec.description   = %q{A base set of utilities for common Ethereum functions.}
  spec.homepage      = "https://github.com/janx/ruby-ethereum-base"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('digest-sha3', '~> 1.1')

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency('minitest', '5.8.3')
  spec.add_development_dependency "rake", "~> 10.0"
end
