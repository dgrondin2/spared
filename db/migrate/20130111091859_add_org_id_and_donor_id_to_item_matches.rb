class AddOrgIdAndDonorIdToItemMatches < ActiveRecord::Migration
  def change
    add_column :item_matches, :donor_id, :integer
    add_column :item_matches, :organization_id, :integer
  end
end
