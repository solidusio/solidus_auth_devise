# frozen_string_literal: true

module Spree
  module UsersControllerDecorator
    def self.prepended(base)
      base.class_eval do
        before_action :authenticate_spree_user!, except: [:new, :create]
      end
    end

    ::Spree::UsersController.prepend self
  end
end
