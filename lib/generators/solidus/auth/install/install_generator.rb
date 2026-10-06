# frozen_string_literal: true

module Solidus
  module Auth
    module Generators
      class InstallGenerator < Rails::Generators::Base
        class_option :auto_run_migrations, type: :boolean, desc: "Run migrations automatically"
        class_option :skip_migrations, type: :boolean, desc: "Skip migrations"

        class_option :interactive, type: :boolean, default: false, desc: "Enable interactive mode"
        class_option :admin_email, type: :string
        class_option :admin_password, type: :string

        source_root "#{__dir__}/templates"

        def generate_devise_key
          template "config/initializers/devise.rb.erb", "config/initializers/devise.rb", skip: true
        end

        def add_migrations
          rake "railties:install:migrations FROM=solidus_auth"
        end

        def run_migrations
          if options[:skip_migrations] ||
              options[:auto_run_migrations] == false || # exclude nil
              options[:interactive] && no?("Would you like to run the migrations now?")

            @migrations_skipped = true
            say_status :skip, "Skipping rake db:migrate, don't forget to run it!", :yellow
          else
            rake "db:migrate"
          end
        end

        def create_admin_user
          return if @migrations_skipped

          admin_email = options[:admin_email] || (options[:interactive] && ask("Email:", default: "admin@example.com"))
          admin_password = options[:admin_password] || (options[:interactive] && ask("Password:", default: "test123"))
          return unless admin_email || admin_password

          env = []
          env << "ADMIN_EMAIL=#{admin_email.shellescape}" if admin_email
          env << "ADMIN_PASSWORD=#{admin_password.shellescape}" if admin_password

          rake "spree_auth:admin:create #{env.join(" ")}"
        end
      end
    end
  end
end
