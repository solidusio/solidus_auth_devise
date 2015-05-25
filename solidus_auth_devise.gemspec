# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_auth_devise"
  s.version     = "1.0.0"
  s.summary     = "Provides authentication and authorization services for use with Solidus by using Devise and CanCan."
  s.description = s.summary

  s.required_ruby_version = ">= 2.1"
  s.license     = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  spree_version = "~> 2.4.0"

  s.add_dependency "spree_core", spree_version
  s.add_dependency "devise", "~> 3.2.3"
  s.add_dependency "devise-encryptable", "0.1.2"

  s.add_dependency "json"
  s.add_dependency "multi_json"

  s.add_development_dependency "spree_backend", spree_version
  s.add_development_dependency "spree_frontend", spree_version
  s.add_development_dependency "rspec-rails", "~> 3.0.0"
  s.add_development_dependency "simplecov", "~> 0.9.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails", "~> 4.0.0"
  s.add_development_dependency "coffee-rails", "~> 4.0.0"
  s.add_development_dependency "shoulda-matchers", "~> 2.6.2"
  s.add_development_dependency "factory_girl", "~> 4.4"
  s.add_development_dependency "capybara", "~> 2.4.1"
  s.add_development_dependency "poltergeist", "~> 1.5"
  s.add_development_dependency "database_cleaner", "~> 1.2.0"
end
