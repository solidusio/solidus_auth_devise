# frozen_string_literal: true

module Spree
  module Auth
    def self.config
      yield(Spree::Auth::Config)
    end
  end
end
