get '/projects' do
    projects = Project.all

    content_type :json
    return projects.to_json
end

post '/projects' do
    project_name = params[:project_name]
    customer_id = params[:customer_id]

    project = Project.create(:project_name => project_name, :customer_id => customer_id)

    saveSuccessful = project.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end

