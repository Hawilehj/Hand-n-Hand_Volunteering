class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :state
      t.integer :zipcode
      t.string :city
      t.string :organization

      t.timestamps
    end
  end
end
