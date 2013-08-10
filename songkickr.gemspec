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

  gem.add_development_dependency 'shoulda',   ">= 2.11.0"
  gem.add_development_dependency 'fakeweb',   ">= 1.3.0"
  gem.add_development_dependency 'rdoc',      "~> 4.0.1"
  gem.add_development_dependency 'crack',     ">= 0"
  gem.add_development_dependency 'rake',      "~> 10.0.0"
  gem.add_development_dependency 'test-unit', "~> 2.5.5"
  gem.add_development_dependency 'vcr',       "~> 2.5.0"
  gem.add_development_dependency 'pry'

  gem.add_dependency 'httparty', '~> 0.8.3'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
end
