# frozen_string_literal: true

RSpec.configure do |config|
  if SolidusSupport.reset_spree_preferences_deprecated?
    config.before :suite do
      Spree::TestingSupport::Preferences.freeze_preferences(Spree::Auth::Config)
    end
  else
    config.before do
      Spree::Auth::Config.preference_store = Spree::Auth::Config.default_preferences
    end
  end
end
