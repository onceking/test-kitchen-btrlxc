# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/driver/btrlxc_version'

Gem::Specification.new do |spec|
  spec.name          = "kitchen-btrlxc"
  spec.version       = Kitchen::Driver::BTRLXC_VERSION
  spec.authors       = ["Sai Ke WANG"]
  spec.email         = ["sai@onceking.com"]
  spec.summary       = %q{test kitchen driver using lxc containers on btrfs.}
  spec.homepage      = "https://github.com/onceking/test-kitchen-btrlxc"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "test-kitchen", "~> 1.4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
