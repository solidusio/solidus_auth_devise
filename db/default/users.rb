# frozen_string_literal: true

# see last line where we create an admin if there is none, asking for email and password
def prompt_for_admin_password
  if ENV['ADMIN_PASSWORD']
    password = ENV['ADMIN_PASSWORD'].dup
    puts "Admin Password #{password}"
  else
    print "Password [test123]: "
    password = STDIN.gets.strip
    password = 'test123' if password.blank?
  end

  password
end

def prompt_for_admin_email
  if ENV['ADMIN_EMAIL']
    email = ENV['ADMIN_EMAIL'].dup
    puts "Admin User #{email}"
  else
    print "Email [admin@example.com]: "
    email = STDIN.gets.strip
    email = 'admin@example.com' if email.blank?
  end

  email
end

def create_admin_user
  if ENV['AUTO_ACCEPT']
    password = 'test123'
    email = 'admin@example.com'
  else
    puts 'Create the admin user (press enter for defaults).'
    # name = prompt_for_admin_name unless name
    email = prompt_for_admin_email
    password = prompt_for_admin_password
  end
  attributes = {
    password: password,
    password_confirmation: password,
    email: email,
    login: email
  }

  load 'spree/user.rb'

  if Spree::User.find_by(email: email)
    puts "\nWARNING: There is already a user with the email: #{email}, so no account changes were made.  If you wish to create an additional admin user, please run rake spree_auth:admin:create again with a different email.\n\n"
  else
    admin = Spree::User.new(attributes)
    if admin.save
      role = Spree::Role.find_or_create_by(name: 'admin')
      admin.spree_roles << role
      admin.save
      admin.generate_spree_api_key!
      puts "Done!"
    else
      puts "There were some problems with persisting a new admin user:"
      admin.errors.full_messages.each do |error|
        puts error
      end
    end
  end
end

if Spree::User.admin.empty?
  create_admin_user
else
  puts 'Admin user has already been created.'
  puts 'Would you like to create a new admin user? (yes/no)'
  if ["yes", "y"].include? STDIN.gets.strip.downcase
    create_admin_user
  else
    puts 'No admin user created.'
  end
end
