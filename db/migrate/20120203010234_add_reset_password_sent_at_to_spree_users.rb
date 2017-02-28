class AddResetPasswordSentAtToSpreeUsers < Spree::Auth.rails_4_2_compatible_migration_class
  def change
    Spree::User.reset_column_information
    unless Spree::User.column_names.include?("reset_password_sent_at")
      add_column :spree_users, :reset_password_sent_at, :datetime
    end
  end
end
