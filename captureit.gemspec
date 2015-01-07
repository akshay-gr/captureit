# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
$:.push File.expand_path("../lib", __FILE__)

#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'captureit/version'

Gem::Specification.new do |spec|
  spec.name          = "captureit"
  spec.version       = Captureit::VERSION
  spec.authors       = ["AkshayB"]
  spec.email         = ["akshaybabar1@gmail.com"]
  spec.summary       = %q{Capture html pages into images.}
  spec.description   = %q{Capture html pages into images.}
  spec.homepage      = "https://github.com/akshay-gr/captureit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
