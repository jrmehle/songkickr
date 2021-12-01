# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'songkickr/version'

Gem::Specification.new do |gem|
  gem.name        = "songkickr"
  gem.version     = Songkickr::VERSION
  gem.authors     = ["Jared Mehle"]
  gem.email       = ["jrmehle@gmail.com"]
  gem.description = "A Ruby wrapper around the Songkick API. Visit www.songkick.com/developer for documentation on the Songkick API. "
  gem.summary     = "A Ruby wrapper around the Songkick API."
  gem.homepage    = "http://github.com/jrmehle/songkickr"

  gem.add_development_dependency 'shoulda',   ">= 3.5.0"
  gem.add_development_dependency 'webmock',   "~> 1.8.0"
  gem.add_development_dependency 'rdoc',      "~> 6.3.3"
  gem.add_development_dependency 'crack',     ">= 0"
  gem.add_development_dependency 'rake',      "~> 10.3.0"
  gem.add_development_dependency 'test-unit', "~> 3.0.0"
  gem.add_development_dependency 'vcr',       "~> 2.9.0"
  gem.add_development_dependency 'pry',       ">= 0"

  gem.add_dependency 'httparty', '>= 0.5.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
end
