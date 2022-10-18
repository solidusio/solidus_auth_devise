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
          template 'config/initializers/devise.rb', 'config/initializers/devise.rb', skip: true
        end

        def add_migrations
          admin_email = options[:admin_email] || (options[:interactive] && ask("Email:", default: 'admin@example.com'))
          admin_password = options[:admin_password] || (options[:interactive] && ask("Password:", default: 'test123'))

          options = []
          options << "ADMIN_EMAIL=#{admin_email}" if admin_email
          options << "ADMIN_PASSWORD=#{admin_password}" if admin_password

          rake "railties:install:migrations FROM=solidus_auth #{options.shelljoin}"
        end

        def run_migrations
          if options[:skip_migrations] ||
            options[:auto_run_migrations] == false || # exclude nil
            options[:interactive] && no?('Would you like to run the migrations now?')

            say_status :skip, 'Skipping rake db:migrate, don\'t forget to run it!', :yellow
          else
            rake 'db:migrate'
          end
        end
      end
    end
  end
end
