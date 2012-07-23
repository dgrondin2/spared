class RemovePasswords < ActiveRecord::Migration
  def up
  	remove_column :donors, :password
  	remove_column :organizations, :password
  end

  def down
  	add_column :donors, :password, :string
  	add_column :organizations, :password, :string
  end
end
