class WishlistItem < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :quantity, :wishlist_id

  belongs_to :wishlist
  belongs_to :item_match
end
