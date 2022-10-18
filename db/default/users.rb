# frozen_string_literal: true

admin_role = Spree::Role.find_or_create_by(name: 'admin')

if Spree::User.admin.any?
  puts 'No admin user created.'
  return
end

email = ENV['ADMIN_EMAIL'] || 'admin@example.com'
password = ENV['ADMIN_PASSWORD'] || 'test123'

puts "Creating admin user with:"
puts "  - email: #{email}"
puts "  - password: #{password}"
puts "(please use the ADMIN_EMAIL and ADMIN_PASSWORD environment variables to control how the default admin user is created)"

if Spree::User.find_by(email: email)
  warn "WARNING: There is already a user with the email: #{email}, so no account changes were made."
  return
end

admin = Spree::User.new(
  password: password,
  password_confirmation: password,
  email: email,
  login: email,
)

if admin.save
  admin.spree_roles << admin_role
  admin.save
  admin.generate_spree_api_key!
else
  warn "There were some problems while creating the admin user:"
  warn(admin.errors.full_messages.map { |m| "- #{m}" })
  warn "(attributes: #{admin.attributes.inspect})"
end
