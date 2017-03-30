class JobReferencesLocation < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.references :location, foreign_key: true
    end
  end
end
