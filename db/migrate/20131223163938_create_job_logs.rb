class CreateJobLogs < ActiveRecord::Migration
  def change
    create_table :job_logs do |t|
      t.integer :imported_job_count
      t.string :imported_job_ids

      t.timestamps
    end
  end
end