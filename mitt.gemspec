# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mitt/version'

Gem::Specification.new do |spec|
  spec.name          = "mitt"
  spec.version       = Mitt::VERSION
  spec.authors       = ["Kevin Kuchta"]
  spec.email         = ["kevin@kevinkuchta.com"]

  spec.summary       = %q{Receive http requests and print them to standard out}
  spec.homepage      = "https://github.com/kkuchta/mitt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", "~> 1.0"
  spec.add_dependency "thin", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.0"
end
