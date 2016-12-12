# Get all tasks for the logged-in user
get '/tasks' do

    tasks = Task.all(:user_id => getCurrentUser().id)

    tasks.each do |task|
        
        task.task_entries = TaskEntry.all(:task_id => task.id)

    end


    return tasks.to_json(:methods => [:task_entries])
end


# Get a specific task
get '/task/:id' do

    id = params[:id]

    task = Task.get(id)
	get_item(task)
end


# Create a new task
post '/tasks' do

    name = params[:name]
    project_id = params[:project_id]
    user_id = params[:user_id]

    project = Project.first(:id => project_id)
    user = User.first(:id => user_id)

    if project and user then

        task = Task.create(:name => name, :project_id => project_id, :user_id => user_id)
        create_item(task)

    else

        response.status = STATUS_BAD_REQUEST
    end
end


# Modify a task
put '/task/:id' do

    id = params[:id]
    name = params[:name]
    project_id = params[:project_id]
    user_id = params[:user_id]

    updated_parameters = {:name => name, :project_id => project_id, :user_id => user_id}

    task = Task.get(id)
    update_item(task, updated_parameters)
end


# Delete a task
delete '/task/:id' do

    id = params[:id]

    task = Task.get(id)
    delete_item(task)
end
