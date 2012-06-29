class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.string :representative_name
      t.string :email
      t.string :password
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :limited_address
      t.string :website
      t.text :organization_description
      t.binary :image

      t.timestamps
    end
  end
end
