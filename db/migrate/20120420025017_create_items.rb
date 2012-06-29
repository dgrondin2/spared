class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip
      t.string :category
      t.string :animal_type
      t.string :condition
      t.decimal :estimated_value
      t.date :expiration_date
      t.text :description
      t.binary :image

      t.timestamps
    end
  end
end
