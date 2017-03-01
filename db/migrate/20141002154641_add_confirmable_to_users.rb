class AddConfirmableToUsers < Spree::Auth.rails_4_2_compatible_migration_class
  def change
    add_column :spree_users, :confirmation_token, :string
    add_column :spree_users, :confirmed_at, :datetime
    add_column :spree_users, :confirmation_sent_at, :datetime
  end
end
