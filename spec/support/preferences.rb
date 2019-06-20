# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    Spree::Auth::Config.preference_store = Spree::Auth::Config.default_preferences
  end
end
