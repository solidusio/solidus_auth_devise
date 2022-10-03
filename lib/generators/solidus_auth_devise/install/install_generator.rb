# frozen_string_literal: true

require_relative '../../solidus/auth/install/install_generator'

module SolidusAuthDevise
  module Generators
    class InstallGenerator < Rails::Generators::Base
      # Copy over any class option from the legacy install generator
      Solidus::Auth::Generators::InstallGenerator.class_options.each do |name, option|
        class_options[name] ||= option.dup
      end

      def forward_to_spree_auth_install
        generate 'solidus:auth:install', *ARGV
      end
    end
  end
end
