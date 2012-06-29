class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.date :date_donated
      t.decimal :amount

      t.timestamps
    end
  end
end
