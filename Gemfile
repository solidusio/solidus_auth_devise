# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')

git "https://github.com/solidusio/solidus.git", branch: branch do
  gem 'solidus_api'
  gem 'solidus_backend'
  gem 'solidus_core'
  gem 'solidus_frontend'
  gem 'solidus_sample'
end

gem 'rails', ENV.fetch('RAILS_VERSION', nil)

case ENV['DB']
when 'mysql'
  gem 'mysql2'
when 'postgresql'
  gem 'pg'
else
  gem 'sqlite3'
end

gem 'rails-controller-testing', group: :test

gemspec

# Use a local Gemfile to include development dependencies that might not be
# relevant for the project or for other contributors, e.g.: `gem 'pry-debug'`.
eval_gemfile 'Gemfile-local' if File.exist? 'Gemfile-local'
