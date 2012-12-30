class AddDonorIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :donor_id, :integer
  end
end
