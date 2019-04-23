# frozen_string_literal: true

require 'spree/core'
require 'devise'
require 'devise-encryptable'
require 'cancan'

module Spree
  module Auth
    def self.config
      yield(Spree::Auth::Config)
    end
  end
end

require 'spree/auth/engine'
