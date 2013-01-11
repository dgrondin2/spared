class AddAvatarToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :avatar, :binary
    add_attachment :donors, :avatar
  end
end
