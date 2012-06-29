class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :limited_address
      t.text :bio
      t.binary :image

      t.timestamps
    end
  end
end
