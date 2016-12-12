# Get all projects (with associated tasks) assigned to the current user
get '/projects' do

    user = getCurrentUser()

    # All tasks assigned to a user
    tasks = Task.all(:user_id => user.id)

    projects = []

    # The projects for each of the tasks
    tasks.each do |task|
        projects << task.project
    end

    projects.each do |project|

        project.tasks = Task.all(:project_id => project.id, :user_id => user.id)

    end

    return projects.to_json(:methods => [:tasks])
end


# Get a specific project
get '/project/:id' do

    id = params[:id]

    project = Project.get(id)
	get_item(project)
end


# Create a new project
post '/projects' do

    name = params[:name]
    customer_id = params[:customer_id]

    customer = Customer.first(:id => customer_id)

    if customer then

        project = Project.create(:name => name, :customer_id => customer_id)
        create_item(project)
    else
        response.status = STATUS_BAD_REQUEST
    end
end


# Modify a project
put '/project/:id' do

    id = params[:id]
    name = params[:name]
    customer_id = params[:customer_id]

    updated_parameters = {:name => name, :customer_id => customer_id}

    project = Project.get(id)
    update_item(project, updated_parameters)
end


# Delete a project
delete '/project/:id' do

    id = params[:id]

    project = Project.get(id)
    delete_item(project)
end
