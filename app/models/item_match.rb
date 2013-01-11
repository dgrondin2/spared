class ItemMatch < ActiveRecord::Base
  belongs_to :item_offer
  belongs_to :wishlist_item
  belongs_to :organization
  belongs_to :donor
end
