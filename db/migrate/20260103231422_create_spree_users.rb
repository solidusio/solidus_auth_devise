# frozen_string_literal: true

class CreateSpreeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :spree_users, if_not_exists: true do |t|
      t.string :login
      t.string :email
      t.string :unconfirmed_email

      t.string :encrypted_password, limit: 128
      t.string :password_salt, limit: 128
      t.string :reset_password_token
      t.string :spree_api_key, limit: 48

      t.string :confirmation_token
      t.string :perishable_token
      t.string :persistence_token
      t.string :remember_token
      t.string :unlock_token

      t.integer :sign_in_count, default: 0, null: false
      t.integer :failed_attempts, default: 0, null: false

      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.references :ship_address, foreign_key: {to_table: :spree_addresses}
      t.references :bill_address, foreign_key: {to_table: :spree_addresses}

      t.datetime :confirmation_sent_at
      t.datetime :confirmed_at
      t.datetime :current_sign_in_at
      t.datetime :deleted_at
      t.datetime :last_request_at
      t.datetime :last_sign_in_at
      t.datetime :locked_at
      t.datetime :remember_created_at
      t.datetime :reset_password_sent_at

      t.timestamps null: false
    end

    if column_exists?(:spree_users, :deleted_at)
      add_index :spree_users, :deleted_at, if_not_exists: true
    end

    if column_exists?(:spree_users, :email)
      add_index :spree_users, :email,
        name: "email_idx_unique",
        if_not_exists: true,
        unique: true
    end

    if column_exists?(:spree_users, :reset_password_token)
      add_index :spree_users, :reset_password_token,
        if_not_exists: true,
        unique: true
    end
  end
end
