get '/task_entries' do
    task_entries = Task_entry.all

    content_type :json
    return task_entries.to_json
end
