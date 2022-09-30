# frozen_string_literal: true

module Spree
  module AuthenticationHelpers
    def self.included(receiver)
      if receiver.send(:respond_to?, :helper_method)
        receiver.send(:helper_method, :spree_current_user)

        if SolidusSupport.frontend_available?
          receiver.send(:helper_method, :spree_login_path)
          receiver.send(:helper_method, :spree_signup_path)
          receiver.send(:helper_method, :spree_logout_path)
        end
      end
    end

    def spree_current_user
      current_spree_user
    end

    if SolidusSupport.frontend_available?
      delegate :login_path, :signup_path, :logout_path,
               to: :spree,
               prefix: :spree
    end

    private

    def authenticate_spree_user!
      store_spree_user_location! if storable_spree_user_location?

      super
    end

    # It's important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_spree_user_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_spree_user_location!
      store_location_for(:spree_user, request.fullpath)
    end

    def stored_spree_user_location_or(fallback_location)
      stored_location_for(:spree_user) || fallback_location
    end
  end
end
