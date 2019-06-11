# encoding: UTF-8

$:.unshift File.expand_path('lib', __dir__)
require 'spree/auth/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_auth_devise"
  s.version     = Spree::Auth::VERSION
  s.summary     = "Provides authentication and authorization services for use with Solidus by using Devise and CanCan."
  s.description = s.summary

  s.author       = 'Solidus Team'
  s.email        = 'contact@solidus.io'

  s.required_ruby_version = ">= 2.1"
  s.license     = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  solidus_version = [">= 1.2.0", "< 3"]

  s.add_dependency "solidus_core", solidus_version
  s.add_dependency "solidus_support", ">= 0.1.3"
  s.add_dependency "devise", '~> 4.1'
  s.add_dependency "devise-encryptable", "0.2.0"

  s.add_development_dependency "capybara", "~> 2.14"
  s.add_development_dependency "capybara-screenshot"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "database_cleaner", "~> 1.6"
  s.add_development_dependency "ffaker"
  s.add_development_dependency "gem-release", "~> 2.0"
  s.add_development_dependency "poltergeist", "~> 1.5"
  s.add_development_dependency "rspec-rails", "~> 3.3"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "shoulda-matchers", "~> 3.1"
  s.add_development_dependency "simplecov", "~> 0.14"
  s.add_development_dependency "solidus_backend", solidus_version
  s.add_development_dependency "solidus_frontend", solidus_version
  s.add_development_dependency "sqlite3", "~> 1.3.6"
end
