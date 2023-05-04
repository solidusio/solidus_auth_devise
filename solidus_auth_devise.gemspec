# frozen_string_literal: true

require_relative 'lib/solidus_auth_devise/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_auth_devise'
  spec.version = SolidusAuthDevise::VERSION
  spec.authors = ['Solidus Team']
  spec.email = 'contact@solidus.io'

  spec.summary = 'Provides authentication and authorization services for use with Solidus by using Devise and CanCan.'
  spec.homepage = 'https://github.com/solidusio/solidus_auth_devise'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/solidusio/solidus_auth_devise'
  spec.metadata['changelog_uri'] = 'https://github.com/solidusio/solidus_auth_devise/releases'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'deface', '~> 1.0'
  spec.add_dependency 'devise', '~> 4.1'
  spec.add_dependency 'devise-encryptable', '0.2.0'
  spec.add_dependency 'solidus_core', ['>= 3', '< 5']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'solidus_backend'
  spec.add_development_dependency 'solidus_frontend'
  spec.add_development_dependency 'solidus_dev_support', '~> 2.5'
  spec.add_development_dependency 'rails-controller-testing'
end
