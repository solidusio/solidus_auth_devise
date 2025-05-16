# frozen_string_literal: true

module SolidusAuthDevise
  module Admin
    module BaseControllerPatch
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
