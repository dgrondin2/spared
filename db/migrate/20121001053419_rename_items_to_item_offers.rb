class RenameItemsToItemOffers < ActiveRecord::Migration
  def change
  	rename_table :items, :itemoffers
  end
end
