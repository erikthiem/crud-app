# Get all tasks
get '/tasks' do

    tasks = Task.all
    return tasks.to_json
end


# Get a specific task
get '/task/:id' do

    id = params[:id]

    task = Task.get(id)
	get_item(task)
end


# Create a new task
post '/tasks' do

    task_name = params[:task_name]
    project_id = params[:project_id]
    user_id = params[:user_id]

    task = Task.create(:task_name => task_name, :project_id => project_id, :user_id => user_id)
	create_item(task)
end


# Modify a task
put '/task/:id' do

    id = params[:id]
    task_name = params[:task_name]
    project_id = params[:project_id]
    user_id = params[:user_id]

    updated_parameters = {:task_name => task_name, :project_id => project_id, :user_id => user_id}

    task = Task.get(id)
    update_item(task, updated_parameters)
end


# Delete a task
delete '/task/:id' do

    id = params[:id]

    task = Task.get(id)
    delete_item(task)
end
