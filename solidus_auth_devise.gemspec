# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'spree/auth/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "solidus_auth_devise"
  s.version = Spree::Auth::VERSION
  s.summary = "Provides authentication and authorization services for use with Solidus by using Devise and CanCan."
  s.license = 'BSD-3-Clause'

  s.author = 'Solidus Team'
  s.email = 'contact@solidus.io'
  s.homepage = 'https://github.com/solidusio/solidus_auth_devise'

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.required_ruby_version = '~> 2.4'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  solidus_version = [">= 2.6", "< 3"]

  s.post_install_message = "
    NOTE: Rails 6 has removed secret_token in favor of secret_key_base, which was deprecated in
    Rails 5.2. solidus_auth_devise will keep using secret_token, when present, as the pepper. If
    secret_token is undefined or not available, secret_key_base will be used instead.
  ".strip.gsub(/ +/, ' ')

  s.add_dependency "deface", "~> 1.0"
  s.add_dependency "devise", '~> 4.1'
  s.add_dependency "devise-encryptable", "0.2.0"
  s.add_dependency "paranoia", "~> 2.4"
  s.add_dependency "solidus_core", solidus_version
  s.add_dependency "solidus_support", "~> 0.5"

  s.add_development_dependency "solidus_backend", solidus_version
  s.add_development_dependency "solidus_dev_support", ">= 0.3.0"
  s.add_development_dependency "solidus_frontend", solidus_version
end
