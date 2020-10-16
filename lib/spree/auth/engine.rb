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
        require 'spree/auth_configuration'

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

      def self.redirect_back_on_unauthorized?
        return false unless Spree::Config.respond_to?(:redirect_back_on_unauthorized)

        if Spree::Config.redirect_back_on_unauthorized
          true
        else
          Spree::Deprecation.warn <<-WARN.strip_heredoc, caller
            Having Spree::Config.redirect_back_on_unauthorized set
            to `false` is deprecated and will not be supported in Solidus 3.0.
            Please change this configuration to `true` and be sure that your
            application does not break trying to redirect back when there is
            an unauthorized access.
          WARN

          false
        end
      end

      def self.prepare_backend
        Spree::Admin::BaseController.unauthorized_redirect = -> do
          if try_spree_current_user
            flash[:error] = I18n.t('spree.authorization_failure')

            if Spree::Auth::Engine.redirect_back_on_unauthorized?
              redirect_back(fallback_location: spree.admin_unauthorized_path)
            else
              redirect_to spree.admin_unauthorized_path
            end
          else
            store_location

            if Spree::Auth::Engine.redirect_back_on_unauthorized?
              redirect_back(fallback_location: spree.admin_login_path)
            else
              redirect_to spree.admin_login_path
            end
          end
        end
      end


      def self.prepare_frontend
        Spree::BaseController.unauthorized_redirect = -> do
          if try_spree_current_user
            flash[:error] = I18n.t('spree.authorization_failure')

            if Spree::Auth::Engine.redirect_back_on_unauthorized?
              redirect_back(fallback_location: spree.unauthorized_path)
            else
              redirect_to spree.unauthorized_path
            end
          else
            store_location

            if Spree::Auth::Engine.redirect_back_on_unauthorized?
              redirect_back(fallback_location: spree.login_path)
            else
              redirect_to spree.login_path
            end
          end
        end
      end
    end
  end
end
