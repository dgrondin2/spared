class AddDonorIdToItemOffer < ActiveRecord::Migration
  def change
    add_column :item_offers, :donor_id, :integer
  end
end
