class RenameItemsAgain < ActiveRecord::Migration
  def change
  	rename_table :itemoffers, :item_offers
  end
end
