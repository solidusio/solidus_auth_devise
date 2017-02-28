require 'spree/core'
require 'devise'
require 'devise-encryptable'
require 'cancan'

module Spree
  module Auth
    def self.config(&block)
      yield(Spree::Auth::Config)
    end

    def self.rails_4_2_compatible_migration_class
      if Rails.gem_version >= Gem::Version.new('5')
        ActiveRecord::Migration[4.2]
      else
        ActiveRecord::Migration
      end
    end
  end
end

require 'spree/auth/engine'
