class CreateItemMatches < ActiveRecord::Migration
  def change
    create_table :item_matches do |t|
      t.integer :item_offer_id
      t.integer :wishlist_item_id
      t.datetime :date_matched

      t.timestamps
    end
  end
end
