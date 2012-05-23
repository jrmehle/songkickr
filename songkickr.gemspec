# -*- encoding: utf-8 -*-
require File.expand_path('../lib/songkickr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jared Mehle"]
  gem.email         = ["jrmehle@gmail.com"]
  gem.description   = %q{A Ruby wrapper around the Songkick API. Visit www.songkick.com/developer for documentation on the Songkick API.}
  gem.summary       = %q{A Ruby wrapper around the Songkick API.}
  gem.homepage      = "http://github.com/jrmehle/songkickr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "songkickr"
  gem.require_paths = ["lib"]
  gem.version       = Songkickr::VERSION
  gem.date          = "2010-04-07"

  gem.add_dependency "httparty", "~> 0.8.3"

  gem.add_development_dependency "rspec",   "~> 2.10.0"
  gem.add_development_dependency "fakeweb", "~> 1.3.0"
  gem.add_development_dependency "shoulda", "~> 3.0.1"
end
