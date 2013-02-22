class AddDescriptionAndImageToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :description, :text
    add_column :wishlists, :image, :binary
    add_column :wishlists, :organization_id, :integer
    add_attachment :wishlists, :image
  end
end
