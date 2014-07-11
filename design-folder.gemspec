# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'design_folder/version'

Gem::Specification.new do |spec|
  spec.name          = "design-folder"
  spec.version       = DesignFolder::VERSION
  spec.authors       = ["Valentino Stoll"]
  spec.email         = ["thevalentino+code@gmail.com"]
  spec.summary       = %q{Searches for, and organizes, your design assets.}
  spec.description   = %q{Searches for, and organizes, your design assets.}
  spec.homepage      = "https://github.com/codenamev/design-folder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'highline', '~> 1.6.21'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
end
