# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth-artsy/version'

Gem::Specification.new do |s|
  s.name = 'omniauth-artsy'
  s.version = Omniauth::Artsy::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Dylan Fareed']
  s.email = ['dylan@artsy.net']
  s.homepage = 'https://github.com/artsy/omniauth-artsy'
  s.summary = 'Omniauth plugin for Artsy authentication.  '
  s.description = 'Omniauth plugin for Artsy authentication.  '
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.license = 'MIT'

  s.add_runtime_dependency 'omniauth-oauth2', '>= 1.0.2'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdiscount'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rubocop', '0.25.0'
end
