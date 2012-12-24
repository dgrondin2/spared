class PrepareTablesForNewAuth < ActiveRecord::Migration
  def change
    remove_column :donors, :email
    remove_column :donors, :encrypted_password
    remove_column :donors, :reset_password_token
    remove_column :donors, :reset_password_sent_at
    remove_column :donors, :remember_created_at
    remove_column :donors, :sign_in_count
    remove_column :donors, :current_sign_in_at
    remove_column :donors, :last_sign_in_at
    remove_column :donors, :current_sign_in_ip
    remove_column :donors, :last_sign_in_ip

    remove_column :organizations, :email
    remove_column :organizations, :encrypted_password
    remove_column :organizations, :reset_password_token
    remove_column :organizations, :reset_password_sent_at
    remove_column :organizations, :remember_created_at
    remove_column :organizations, :sign_in_count
    remove_column :organizations, :current_sign_in_at
    remove_column :organizations, :last_sign_in_at
    remove_column :organizations, :current_sign_in_ip
    remove_column :organizations, :last_sign_in_ip

    remove_column :users, :crypted_password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    add_column :users, :password_digest, :string

    drop_table :user_sessions
  end
end
