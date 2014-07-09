json.array!(@microblogs) do |microblog|
  json.extract! microblog, :id, :content, :user_id, :tag
  json.url microblog_url(microblog, format: :json)
end
