get '/task_entries' do
    task_entries = TaskEntry.all

    content_type :json
    return task_entries.to_json
end

post '/task_entries' do
    note = params[:note]
    task_id = params[:task_id]

    task_entry = TaskEntry.create(:note => note, :task_id => task_id)

    saveSuccessful = task_entry.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end
