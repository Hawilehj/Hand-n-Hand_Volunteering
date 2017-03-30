class DropJobIdFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :job_id, :integer
  end
end
