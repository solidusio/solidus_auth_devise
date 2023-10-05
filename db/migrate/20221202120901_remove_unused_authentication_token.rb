class RemoveUnusedAuthenticationToken < ActiveRecord::Migration[7.0]
  def change
    remove_column :spree_users, :authentication_token, :string
  end
end
