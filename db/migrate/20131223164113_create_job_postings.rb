class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.datetime :published
      t.string :link
      t.text :description
      t.integer :osu_job_id
      t.belongs_to :department, index: true

      t.timestamps
    end
  end
end