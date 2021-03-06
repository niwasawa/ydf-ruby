# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ydf/version'

Gem::Specification.new do |spec|
  spec.name          = "ydf"
  spec.version       = YDF::VERSION
  spec.authors       = ["Naoki Iwasawa"]
  spec.email         = ["niwasawa@maigo.info"]

  spec.summary       = %q{This library is a converter of geo data format for YDF (YOLP Data Format) on Ruby. This library is experimental and unstable.}
  spec.description   = %q{This library is a converter of geo data format for YDF (YOLP Data Format) on Ruby. This library is experimental and unstable.}
  spec.homepage      = "https://github.com/niwasawa/ydf-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
