class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :when
      t.string :city
      t.string :state
      t.text :description
      t.integer :number_of_volunteers_needed
      t.binary :image

      t.timestamps
    end
  end
end
