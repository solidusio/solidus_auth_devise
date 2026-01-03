# frozen_string_literal: true

module SolidusAuthDevise
  module ApplicationControllerPatch
    def self.prepended(base)
      return unless base.respond_to?(:helper_method)

      base.send(:helper_method, :spree_current_user)

      return unless SolidusSupport.frontend_available?

      base.send(:helper_method, :spree_login_path)
      base.send(:helper_method, :spree_signup_path)
      base.send(:helper_method, :spree_logout_path)
    end

    def spree_current_user
      current_spree_user
    end

    if SolidusSupport.frontend_available?
      delegate :login_path, :signup_path, :logout_path,
        to: :spree,
        prefix: :spree
    end

    ApplicationController.prepend self
  end
end
