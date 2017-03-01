class AddDeletedAtToUsers < Spree::Auth.rails_4_2_compatible_migration_class
  def change
    add_column :spree_users, :deleted_at, :datetime
    add_index :spree_users, :deleted_at
  end
end
