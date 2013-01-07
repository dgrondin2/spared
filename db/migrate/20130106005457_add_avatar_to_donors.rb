class AddAvatarToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :avatar, :attachment
    add_attachment :donors, :avatar
  end
end
