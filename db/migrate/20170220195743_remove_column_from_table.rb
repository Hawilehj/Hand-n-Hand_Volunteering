class RemoveColumnFromTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :job_id
    remove_column :locations, :location_id
  end
end
