require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

require 'capybara-screenshot/rspec'
Capybara.save_and_open_page_path = ENV['CIRCLE_ARTIFACTS'] if ENV['CIRCLE_ARTIFACTS']

RSpec.configure do |config|
  Capybara.javascript_driver = :poltergeist
end
