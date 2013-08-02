# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-artsy/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-artsy"
  s.version     = Omniauth::Artsy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Artsy"]
  s.email       = ["dylan@artsy.net"]
  s.homepage    = "https://github.com/dylanfareed/omniauth-artsy"
  s.summary     = %q{Omniauth plugin for Artsy authentication}
  s.description = %q{Omniauth plugin for Artsy authentication}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth2', '>= 1.0.2'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdiscount'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'

end