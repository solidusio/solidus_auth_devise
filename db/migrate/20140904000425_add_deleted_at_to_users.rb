# frozen_string_literal: true

class AddDeletedAtToUsers < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_users, :deleted_at, :datetime
    add_index :spree_users, :deleted_at
  end
end
