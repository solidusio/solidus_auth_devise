# frozen_string_literal: true

Devise.secret_key = SecureRandom.hex(50).inspect
Devise.email_regexp = Spree::Config[:default_email_regexp]
