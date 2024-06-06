# frozen_string_literal: true

module Spree
  module Admin
    module BaseControllerDecorator
      def self.prepended(base)
        base.class_eval do
          before_action :authenticate_spree_user!
        end
      end

      protected

      def model_class
        const_name = controller_name.classify
        if Spree.const_defined?(const_name, false)
          return "Spree::#{const_name}".constantize
        end

        nil
      end

      ::Spree::Admin::BaseController.prepend self
    end
  end
end
