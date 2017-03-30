class LocationReferencesOrganization < ActiveRecord::Migration[5.0]
  def change
    change_table :locations do |t|
      t.references :organization, foreign_key: true
    end
  end
end
