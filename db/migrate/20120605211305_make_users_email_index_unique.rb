class MakeUsersEmailIndexUnique < Spree::Auth.rails_4_2_compatible_migration_class
  def up
    add_index "spree_users", ["email"], :name => "email_idx_unique", :unique => true
  end

  def down
    remove_index "spree_users", :name => "email_idx_unique"
  end
end
