json.extract! @job_posting, :id, :title, :published, :link, :description, :osu_job_id, :department, :created_at, :updated_at
json.published_at @job_posting.published.strftime('%D')
json.department do |json|
	json.(@job_posting.department, :name)
end
