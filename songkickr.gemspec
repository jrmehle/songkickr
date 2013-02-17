# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'songkickr/version'

Gem::Specification.new do |gem|
  gem.name          = "songkickr"
  gem.version       = Songkickr::VERSION
  gem.authors       = ["Jared Mehle"]
  gem.email         = ["jrmehle@gmail.com"]
  gem.description = "A Ruby wrapper around the Songkick API. Visit www.songkick.com/developer for documentation on the Songkick API. "
  gem.summary = "A Ruby wrapper around the Songkick API."
  gem.homepage = "http://github.com/jrmehle/songkickr"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.rubygems_version = "1.8.25"
  gem.required_rubygems_version = Gem::Requirement.new(">= 0") if gem.respond_to? :required_rubygems_version=
  gem.date = "2013-02-16"
  gem.executables = ["autospec", "convert_to_should_syntax", "guard", "htmldiff", "httparty", "ldiff", "rake", "rake2thor", "rg", "ri", "rspec", "thor"]
  gem.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]

  if gem.respond_to? :specification_version then
    gem.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      gem.add_development_dependency(%q<shoulda>, [">= 2.11.0"])
      gem.add_development_dependency(%q<fakeweb>, [">= 1.3.0"])
      gem.add_development_dependency(%q<redgreen>, [">= 1.2.2"])
      gem.add_development_dependency(%q<crack>, [">= 0"])
      gem.add_development_dependency(%q<httparty>, [">= 0"])
      gem.add_development_dependency(%q<test-unit>, [">= 0"])
      gem.add_development_dependency(%q<rake>, [">= 0"])
      gem.add_development_dependency(%q<vcr>, [">= 0"])
      gem.add_development_dependency(%q<rdoc>, [">= 3.12.1"])
    else
      gem.add_dependency(%q<shoulda>, [">= 2.11.0"])
      gem.add_dependency(%q<fakeweb>, [">= 1.3.0"])
      gem.add_dependency(%q<redgreen>, [">= 1.2.2"])
      gem.add_dependency(%q<crack>, [">= 0"])
      gem.add_dependency(%q<httparty>, [">= 0"])
      gem.add_dependency(%q<test-unit>, [">= 0"])
      gem.add_dependency(%q<rake>, [">= 0"])
      gem.add_dependency(%q<vcr>, [">= 0"])
      gem.add_dependency(%q<rdoc>, [">= 3.12.1"])
    end
  else
    gem.add_dependency(%q<crack>, [">= 0"])
    gem.add_dependency(%q<httparty>, [">= 0"])
    gem.add_dependency(%q<test-unit>, [">= 0"])
    gem.add_dependency(%q<rake>, [">= 0"])
    gem.add_dependency(%q<jeweler>, [">= 0"])
    gem.add_dependency(%q<vcr>, [">= 0"])
    gem.add_dependency(%q<shoulda>, [">= 2.11.0"])
    gem.add_dependency(%q<fakeweb>, [">= 1.3.0"])
    gem.add_dependency(%q<redgreen>, [">= 1.2.2"])
    gem.add_dependency(%q<rdoc>, [">= 3.12.1"])
  end
end
