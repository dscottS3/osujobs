namespace :job_postings do
  desc 'Fetch jobs from ATOM Feed'
  task fetch: :environment do
    
    
      feed = Feedzirra::Feed.fetch_and_parse("https://www.jobsatosu.com/all_jobs.atom")
      jobs = feed.entries.blank? ? '' : feed.entries
    
   
      unless jobs.blank?  # loop thru jobs unless the jobs local var is empty
        jobs_added = Array.new
        JobPosting.destroy_all
        jobs.each do |job| # here we go loopty loo 
      
          # Create new job if it doesn't exist
          JobPosting.where(osu_job_id: job.id).first_or_create do |job_posting|
            job_posting.title = job.title
            job_posting.department = Department.where(name: job.author).first_or_create
            job_posting.published = job.published
            job_posting.link = job.url
            job_posting.osu_job_id = job.id
            job_posting.description = job.content
            jobs_added << job.id
          end
          # end checking and creating new jobs
        
        end # loop end
        imported_job_ids = jobs_added.to_json
        JobLog.create(imported_job_count: jobs_added.size, imported_job_ids: imported_job_ids)
        puts "Number of jobs postings retrieved: #{jobs_added.size}"
      else
        puts "Error in retrieving jobs from feed."
      end # end empty jobs check
    
  end
end