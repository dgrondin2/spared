class Wishlist < ActiveRecord::Base
  attr_accessible :name, :wishlist_item_attributes

  has_many :wishlist_items
end
