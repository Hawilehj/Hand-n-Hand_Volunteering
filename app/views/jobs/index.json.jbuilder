json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :text, :date, :type
  json.url job_url(job, format: :json)
end
