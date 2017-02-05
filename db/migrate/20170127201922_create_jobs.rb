class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :text
      t.datetime :date
      t.string :type

      t.timestamps
    end
  end
end
