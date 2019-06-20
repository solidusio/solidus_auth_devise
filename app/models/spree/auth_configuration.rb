# frozen_string_literal: true

module Spree
  class AuthConfiguration < Preferences::Configuration
    preference :registration_step, :boolean, default: true
    preference :signout_after_password_change, :boolean, default: true
    preference :confirmable, :boolean, default: false
    preference :draw_frontend_routes, :boolean, default: true
    preference :draw_backend_routes, :boolean, default: true
  end
end
