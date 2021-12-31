# frozen_string_literal: true

RSpec.configure do |config|
  config.before do |example|
    if example.metadata.key?(:omniauthable)
      stub_spree_preferences(Spree::Auth::Config, omniauthable: example.metadata[:omniauthable])

      # load File.expand_path('../../../app/models/spree/user.rb', __FILE__)
    end
  end
end
