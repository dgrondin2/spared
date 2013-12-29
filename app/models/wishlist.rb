class Wishlist < ActiveRecord::Base
  attr_accessible :name, :description, :image, :wishlist_item_attributes

  has_many :wishlist_items
end
