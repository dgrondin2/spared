class AddAttachmentToOrganizations < ActiveRecord::Migration
  def self.up
    rename_column :organizations, :image, :avatar
    add_attachment :organizations, :avatar
  end

  def self.down
    remove_attachment :organizations, :avatar
    rename_column :organizations, :avatar, :image
  end
end
