# frozen_string_literal: true

require 'devise'
require 'devise-encryptable'

module Spree
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'solidus_auth'

      initializer "spree.auth.environment", before: :load_config_initializers do |_app|
        Spree::Auth::Config = Spree::AuthConfiguration.new
      end

      initializer "solidus_auth_devise.set_user_class", after: :load_config_initializers do
        Spree.user_class ||= "Spree::User"
      end

      config.to_prepare do
        auth = Spree::Auth::Engine

        auth.prepare_backend  if SolidusSupport.backend_available?
        auth.prepare_frontend if SolidusSupport.frontend_available?

        ApplicationController.send :include, Spree::AuthenticationHelpers
      end

      def self.prepare_backend
        Rails.application.config.assets.precompile += %w[
          lib/assets/javascripts/spree/backend/solidus_auth.js
          lib/assets/javascripts/spree/backend/solidus_auth.css
        ]

        Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/backend/*/*/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

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
        Rails.application.config.assets.precompile += %w[
          lib/assets/javascripts/spree/frontend/solidus_auth.js
          lib/assets/javascripts/spree/frontend/solidus_auth.css
        ]

        Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/frontend/*/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

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

      if SolidusSupport.backend_available?
        paths["app/controllers"] << "lib/controllers/backend"
        paths["app/views"] << "lib/views/backend"
      end

      if SolidusSupport.frontend_available?
        paths["app/controllers"] << "lib/controllers/frontend"
        paths["app/views"] << "lib/views/frontend"
      end
    end
  end
end
