class WishlistItem < ActiveRecord::Base
  attr_accessible :description, :quantity

  belongs_to :organization
end
