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
        Spree.user_class = "Spree::User"
      end

      config.to_prepare do
        auth = Spree::Auth::Engine

        auth.prepare_backend  if SolidusSupport.backend_available?
        auth.prepare_frontend if SolidusSupport.frontend_available?

        ApplicationController.send :include, Spree::AuthenticationHelpers
      end

      def self.prepare_backend
        base_path = root.join('lib/decorators/backend')

        if Rails.respond_to?(:autoloaders) && Rails.autoloaders.main
          # Add decorators folder to the Rails autoloader. This
          # allows Zeitwerk to resolve decorators paths correctly,
          # when used.
          Dir.glob(base_path.join('*')) do |decorators_folder|
            Rails.autoloaders.main.push_dir(decorators_folder)
          end
        end

        # Load decorator files. This is needed since they are
        # never explicitely referenced in the application code
        # and won't be loaded by default. We need them to be
        # executed anyway to extend exisiting classes.
        Dir.glob(base_path.join('**/*_decorator*.rb')) do |decorator_path|
          require_dependency(decorator_path)
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
        base_path = root.join('lib/decorators/frontend')

        if Rails.respond_to?(:autoloaders) && Rails.autoloaders.main
          # Add decorators folder to the Rails autoloader. This
          # allows Zeitwerk to resolve decorators paths correctly,
          # when used.
          Dir.glob(base_path.join('*')) do |decorators_folder|
            Rails.autoloaders.main.push_dir(decorators_folder)
          end
        end

        # Load decorator files. This is needed since they are
        # never explicitely referenced in the application code
        # and won't be loaded by default. We need them to be
        # executed anyway to extend exisiting classes.
        Dir.glob(base_path.join('**/*_decorator*.rb')) do |decorator_path|
          require_dependency(decorator_path)
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
