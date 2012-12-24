class AssociateDonorWithUser < ActiveRecord::Migration
  def change
    add_column :donors, :user_id, :integer
  end
end
