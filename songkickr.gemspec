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

  gem.required_ruby_version = '>= 2.7.0', '< 4.0.0'

  gem.add_development_dependency 'shoulda', '~> 4.0'
  gem.add_development_dependency 'webmock', '~> 3.25', '>= 3.25.1'
  gem.add_development_dependency 'rdoc', '~> 6.14'
  gem.add_development_dependency 'crack', "~> 1.0", ">= 1.0.0"
  gem.add_development_dependency 'rake', "~> 13.3", ">= 13.3.0"
  gem.add_development_dependency 'minitest', '~> 5.25', '>= 5.25.5'
  gem.add_development_dependency 'vcr', '~> 6.3', '>= 6.3.1'
  gem.add_development_dependency 'pry', '~> 0.15.2'

  gem.add_runtime_dependency 'httparty', "~> 0.23", ">= 0.23.1"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files = [
    "CHANGELOG.md",
    "LICENSE",
    "README.rdoc",
  ]
end
