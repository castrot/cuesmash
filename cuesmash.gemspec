# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cuesmash"
  spec.version       = "0.0.1"
  spec.authors       = ["Alex Fish", "Jarod McBride"]
  spec.email         = ["fish@ustwo.co.uk", "jarod@ustwo.com"]
  spec.description   = "A gift for Juan"
  spec.summary       = "Compile an app, point the app at sinatra, run cucumber"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency("CFPropertyList")

  spec.executables << "cuesmash"
end