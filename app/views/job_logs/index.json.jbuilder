json.array!(@job_logs) do |job_log|
  json.extract! job_log, :id
  json.url job_log_url(job_log, format: :json)
end
