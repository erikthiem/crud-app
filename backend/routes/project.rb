get '/projects' do
    projects = Project.all

    content_type :json
    return projects.to_json
end
