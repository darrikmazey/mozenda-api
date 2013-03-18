# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mozenda/version'

Gem::Specification.new do |gem|
  gem.name          = "mozenda-api"
  gem.version       = Mozenda::VERSION
  gem.authors       = ["Darrik Mazey"]
  gem.email         = ["darrik@darmasoft.com"]
  gem.description   = %q{gem for interacting with Mozenda API}
  gem.summary       = %q{gem for interacting with Mozenda API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
