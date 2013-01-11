class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.string :name
      t.integer :quantity
      t.string :description
      t.decimal :price
      t.binary :image
      t.integer :wishlist_id
      t.attachment :image

      t.timestamps
    end
  end
end
