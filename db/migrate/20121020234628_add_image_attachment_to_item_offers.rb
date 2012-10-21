class AddImageAttachmentToItemOffers < ActiveRecord::Migration
  def self.up
    add_attachment :item_offers, :image
  end

  def self.down
    remove_attachment :item_offers, :image
  end
end
