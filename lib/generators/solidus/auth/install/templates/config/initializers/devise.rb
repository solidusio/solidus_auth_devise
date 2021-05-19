# frozen_string_literal: true

Devise.secret_key = SecureRandom.hex(50).inspect
Devise.email_regexp = Spree::EmailValidator::EMAIL_REGEXP
