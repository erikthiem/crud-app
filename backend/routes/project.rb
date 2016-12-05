# Get all projects
get '/projects' do

    projects = Project.all
    return projects.to_json
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

    project = Project.create(:name => name, :customer_id => customer_id)
    create_item(project)
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
