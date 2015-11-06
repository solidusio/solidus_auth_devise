require 'devise'
require 'devise-encryptable'

module Spree
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'solidus_auth'

      initializer "spree.auth.environment", :before => :load_config_initializers do |app|
        Spree::Auth::Config = Spree::AuthConfiguration.new
      end

      initializer "solidus_auth_devise.set_user_class", :after => :load_config_initializers do
        Spree.user_class = "Spree::User"
      end

      initializer "solidus_auth_devise.check_secret_token" do
        if Spree::Auth.default_secret_key == Devise.secret_key
          puts "[WARNING] You are not setting Devise.secret_key within your application!"
          puts "You must set this in config/initializers/devise.rb. Here's an example:"
          puts " "
          puts %Q{Devise.secret_key = "#{SecureRandom.hex(50)}"}
        end
      end

      def self.activate
        if Spree::Auth::Engine.backend_available?
          Rails.application.config.assets.precompile += [
            'lib/assets/javascripts/spree/backend/solidus_auth.js',
            'lib/assets/javascripts/spree/backend/solidus_auth.css'
          ]
          Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/backend/*/*/*_decorator*.rb")) do |c|
            Rails.configuration.cache_classes ? require(c) : load(c)
          end
        end
        if Spree::Auth::Engine.frontend_available?
          Rails.application.config.assets.precompile += [
            'lib/assets/javascripts/spree/frontend/solidus_auth.js',
            'lib/assets/javascripts/spree/frontend/solidus_auth.css'
          ]
          Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/frontend/*/*_decorator*.rb")) do |c|
            Rails.configuration.cache_classes ? require(c) : load(c)
          end
        end
        ApplicationController.send :include, Spree::AuthenticationHelpers

        if self.frontend_available?
          Spree::BaseController.unauthorized_redirect = -> do
            if try_spree_current_user
              flash[:error] = Spree.t(:authorization_failure)
              redirect_to spree.unauthorized_path
            else
              store_location
              redirect_to spree.login_path
            end
          end
        end

        if self.backend_available?
          Spree::Admin::BaseController.unauthorized_redirect = -> do
            if try_spree_current_user
              flash[:error] = Spree.t(:authorization_failure)
              redirect_to spree.admin_unauthorized_path
            else
              store_location
              redirect_to spree.admin_login_path
            end
          end
        end
      end

      def self.backend_available?
        @@backend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Backend::Engine')
      end

      def self.dash_available?
        @@dash_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Dash::Engine')
      end

      def self.frontend_available?
        @@frontend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Frontend::Engine')
      end

      if self.backend_available?
        paths["app/controllers"] << "lib/controllers/backend"
        paths["app/views"] << "lib/views/backend"
      end

      if self.frontend_available?
        paths["app/controllers"] << "lib/controllers/frontend"
        paths["app/views"] << "lib/views/frontend"
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
