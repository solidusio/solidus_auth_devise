# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')

solidus_git, solidus_frontend_git = if (branch == 'master') || (branch >= 'v3.2')
                                      %w[solidusio/solidus solidusio/solidus_frontend]
                                    else
                                      %w[solidusio/solidus] * 2
                                    end

gem 'solidus_api', github: solidus_git, branch: branch
gem 'solidus_backend', github: solidus_git, branch: branch
gem 'solidus_core', github: solidus_git, branch: branch
gem 'solidus_frontend', github: solidus_frontend_git, branch: branch
gem 'solidus_sample', github: solidus_git, branch: branch

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
