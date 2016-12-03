get '/tasks' do
    tasks = Task.all

    content_type :json
    return tasks.to_json
end
