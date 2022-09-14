# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_backend', github: 'solidusio/solidus', branch: branch

# The solidus_frontend gem has been pulled out since v3.2
gem 'solidus_frontend', github: 'solidusio/solidus_frontend' if branch == 'master'
gem 'solidus_frontend' if branch >= 'v3.2' # rubocop:disable Bundler/DuplicatedGem

case ENV.fetch('DB', nil)
when 'mysql'
  gem 'mysql2'
when 'postgresql'
  gem 'pg'
else
  gem 'sqlite3'
end

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3')
  # While we still support Ruby < 3 we need to workaround a limitation in
  # the 'async' gem that relies on the latest ruby, since RubyGems doesn't
  # resolve gems based on the required ruby version.
  gem 'async', '< 3', require: false

  # 'net/smtp' is required by 'mail', see:
  # - https://github.com/ruby/net-protocol/issues/10
  # - https://stackoverflow.com/a/72474475
  gem 'net-smtp', require: false
end

gemspec

# Use a local Gemfile to include development dependencies that might not be
# relevant for the project or for other contributors, e.g. pry-byebug.
#
# We use `send` instead of calling `eval_gemfile` to work around an issue with
# how Dependabot parses projects: https://github.com/dependabot/dependabot-core/issues/1658.
send(:eval_gemfile, 'Gemfile-local') if File.exist? 'Gemfile-local'
