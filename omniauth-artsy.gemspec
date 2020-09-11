# frozen_string_literal: true

require_relative 'lib/omniauth-artsy/version'

Gem::Specification.new do |spec|
  spec.name = 'omniauth-artsy'
  spec.version = Omniauth::Artsy::VERSION
  spec.authors = ['Artsy']
  spec.email = ['dev@artsy.net']

  spec.summary = 'Omniauth plugin for Artsy authentication.'
  spec.description = 'Omniauth plugin for Artsy authentication.'
  spec.homepage = 'https://github.com/artsy/omniauth-artsy'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/artsy/omniauth-artsy/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.1.2'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
end
