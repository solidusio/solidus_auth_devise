# frozen_string_literal: true

module Solidus
  module Auth
    module Generators
      class InstallGenerator < Rails::Generators::Base
        class_option :auto_run_migrations, type: :boolean, default: false
        class_option :skip_migrations, type: :boolean, default: false

        def self.source_paths
          paths = superclass.source_paths
          paths << File.expand_path('templates', __dir__)
          paths.flatten
        end

        def generate_devise_key
          template 'config/initializers/devise.rb', 'config/initializers/devise.rb', skip: true
        end

        def add_migrations
          run 'bundle exec rake railties:install:migrations FROM=solidus_auth'
        end

        def run_migrations
          return if options[:skip_migrations]

          run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
          if run_migrations
            run 'bundle exec rake db:migrate'
          else
            puts 'Skipping rake db:migrate, don\'t forget to run it!' # rubocop:disable Rails/Output
          end
        end
      end
    end
  end
end
