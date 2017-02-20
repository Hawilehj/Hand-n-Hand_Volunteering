class AddLocationidToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :location_id, :integer
  end
end
