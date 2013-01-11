class DumpAndRegenerateDonors < ActiveRecord::Migration
  # I meant to call this DropAndRegenerateDonors. Sorry.
  def change
    drop_table :donors

    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :limited_address
      t.text :bio
      t.binary :avatar

      t.timestamps
    end

    add_attachment :donors, :avatar
  end
end
