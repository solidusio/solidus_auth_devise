# frozen_string_literal: true

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/clean'
require 'spree/testing_support/common_rake'
ENV['DUMMY_PATH'] = "spec/dummy"
ENV['LIB_NAME'] = "solidus/auth"
::CLOBBER.include ENV['DUMMY_PATH']

namespace :extension do
  # We need to go back to the gem root since the upstream
  # extension:test_app changes the working directory to be the dummy app.
  task :test_app do
    Rake::Task['extension:test_app'].invoke
    cd __dir__
  end

  directory ENV['DUMMY_PATH'] do
    Rake::Task['common:test_app'].invoke("Spree::User")
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:specs, [] => FileList[ENV['DUMMY_PATH']]) do |t|
    # Ref: https://circleci.com/docs/2.0/configuration-reference#store_test_results
    # Ref: https://github.com/solidusio/circleci-orbs-extensions#test-results-rspec
    if ENV['TEST_RESULTS_PATH']
      t.rspec_opts =
        "--format progress " \
        "--format RspecJunitFormatter --out #{ENV['TEST_RESULTS_PATH']}"
    end
  end
end

task default: 'extension:specs'

# DEPRECATED:
task test_app: 'extension:test_app'
task spec: 'extension:specs'
