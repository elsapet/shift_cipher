# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shift_cipher/version'

Gem::Specification.new do |spec|
  spec.name          = "shift_cipher"
  spec.version       = ShiftCipher::VERSION
  spec.authors       = ["elsapet"]

  spec.summary       = "encrypt and de-crypt messages"
  spec.description   = "encrypt and de-crypt messages using a simple caeser cipher, given an offset"
  spec.homepage      = "https://github.com/elsapet/shift_cipher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["shift_cipher"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  # testing
  spec.add_development_dependency "rspec", "~> 3.2", ">= 3.2.3"
  spec.add_development_dependency "pry", "~> 0.10.0"
end
