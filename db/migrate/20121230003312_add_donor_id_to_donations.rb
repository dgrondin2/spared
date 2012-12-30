class AddDonorIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donor_id, :integer
  end
end
