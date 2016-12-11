# Get all task entries
get '/task_entries' do

    task_entries = TaskEntry.all
    return task_entries.to_json
end


# Get a specific task entry
get '/task_entry/:id' do

    id = params[:id]

    task_entry = TaskEntry.get(id)
	get_item(task_entry)
end


# Create a new task entry
post '/task_entries' do

    note = params[:note]
    task_id = params[:task_id]

    task = Task.first(:id => task_id)

    if task then

        task_entry = TaskEntry.create(:note => note, :task_id => task_id)
        create_item(task_entry)
    else
        response.status = STATUS_BAD_REQUEST
    end
end


# Modify a task entry
put '/task_entry/:id' do

    id = params[:id]
    note = params[:note]
    task_id = params[:task_id]

    updated_parameters = {:note => note, :task_id => task_id}

    task_entry = TaskEntry.get(id)
    update_item(task_entry, updated_parameters)
end


# Delete a task entry
delete '/task_entry/:id' do

    id = params[:id]

    task_entry = TaskEntry.get(id)
    delete_item(task_entry)
end
