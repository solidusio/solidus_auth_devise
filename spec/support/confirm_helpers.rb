# frozen_string_literal: true

module ConfirmHelpers
  def set_confirmable_option(value)
    if value
      Spree::User.devise_modules.push(:confirmable)
      stub_spree_preferences(Spree::Auth::Config, confirmable: true)
    else
      Spree::User.devise_modules.delete(:confirmable)
      stub_spree_preferences(Spree::Auth::Config, confirmable: false)
    end
  end
end

RSpec.configure do |c|
  c.include ConfirmHelpers
end
