get '/task_entries' do
    task_entries = TaskEntry.all

    content_type :json
    return task_entries.to_json
end
