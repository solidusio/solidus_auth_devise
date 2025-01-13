# frozen_string_literal: true

require 'solidus_auth_devise'
require 'devise'
require 'devise-encryptable'
require 'spree/auth/version'

module Spree
  module Auth
    class Engine < Rails::Engine
      include SolidusSupport::EngineExtensions

      isolate_namespace Spree
      engine_name 'solidus_auth'

      Spree.user_class = "Spree::User"

      initializer "spree.auth.environment", before: :load_config_initializers do |_app|
        require 'spree/auth_configuration'

        Spree::Auth::Config = Spree::AuthConfiguration.new
      end

      if Spree::Config.respond_to?(:unauthorized_redirect_handler_class)
        Spree::Config.unauthorized_redirect_handler_class = "Spree::Auth::UnauthorizedCustomerAccessHandler"
        if SolidusSupport.backend_available?
          Spree::Backend::Config.unauthorized_redirect_handler_class = "Spree::Auth::UnauthorizedAdminAccessHandler"
        end
      else
        config.to_prepare do
          Spree::Auth::Engine.prepare_backend if SolidusSupport.backend_available?
          Spree::Auth::Engine.prepare_frontend if SolidusSupport.frontend_available?
        end
      end

      config.to_prepare do
        ApplicationController.include Spree::AuthenticationHelpers
      end

      def self.prepare_backend
        Spree::Admin::BaseController.unauthorized_redirect = -> do
          Spree::Auth::UnauthorizedAdminAccessHandler.new(self).call
        end
      end

      def self.prepare_frontend
        Spree::BaseController.unauthorized_redirect = -> do
          Spree::Auth::UnauthorizedCustomerAccessHandler.new(self).call
        end
      end
    end
  end
end

SolidusAuthDevise::Engine = Spree::Auth::Engine
