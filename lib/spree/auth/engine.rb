# frozen_string_literal: true

require 'devise'
require 'devise-encryptable'

module Spree
  module Auth
    class Engine < Rails::Engine
      include SolidusSupport::EngineExtensions

      isolate_namespace Spree
      engine_name 'solidus_auth'

      initializer "spree.auth.environment", before: :load_config_initializers do |_app|
        Spree::Auth::Config = Spree::AuthConfiguration.new
      end

      initializer "solidus_auth_devise.set_user_class", after: :load_config_initializers do
        Spree.user_class = "Spree::User"
      end

      config.to_prepare do
        Spree::Auth::Engine.prepare_backend if SolidusSupport.backend_available?
        Spree::Auth::Engine.prepare_frontend if SolidusSupport.frontend_available?

        ApplicationController.include Spree::AuthenticationHelpers
      end

      def self.prepare_backend
        Spree::Admin::BaseController.unauthorized_redirect = -> do
          if try_spree_current_user
            flash[:error] = I18n.t('spree.authorization_failure')
            redirect_to spree.admin_unauthorized_path
          else
            store_location
            redirect_to spree.admin_login_path
          end
        end
      end

      def self.prepare_frontend
        Spree::BaseController.unauthorized_redirect = -> do
          if try_spree_current_user
            flash[:error] = I18n.t('spree.authorization_failure')
            redirect_to spree.unauthorized_path
          else
            store_location
            redirect_to spree.login_path
          end
        end
      end
    end
  end
end
