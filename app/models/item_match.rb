class ItemMatch < ActiveRecord::Base
  attr_accessible :item_offer_id, :wishlist_item_id

  has_one :item_offer
  has_one :wishlist_item
end
