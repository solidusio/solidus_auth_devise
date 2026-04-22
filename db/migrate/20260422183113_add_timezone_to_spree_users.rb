class AddTimezoneToSpreeUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :spree_users, :timezone, :string, if_not_exists: true,
      comment: "User's timezone, e.g., 'Eastern Time (US & Canada)'"
  end
end
