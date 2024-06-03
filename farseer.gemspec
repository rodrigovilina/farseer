# frozen_string_literal: true

require_relative 'lib/farseer/version'

Gem::Specification::new do |spec|
  spec.name        = 'farseer'
  spec.version     = Farseer::VERSION
  spec.authors     = ['vaporyhumo']
  spec.email       = ['roanvilina@gmail.com']
  spec.license     = 'Unlicense'

  spec.summary     = 'Functional Parsing'
  spec.description = 'Functional Parsing Library for Ruby'
  spec.homepage    = 'https://github.com/vaporyhumo/farseer'

  spec.files       = Dir.glob("lib/**/*.rb") + ['README.md', 'LICENSE']

  spec.required_ruby_version = Gem::Requirement::new('~> 3.1')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_dependency 'muina', '~> 0.4'
  spec.add_dependency 'zeitwerk', '~> 2'
end
