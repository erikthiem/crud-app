get '/' do
    "Hello World!"
end

get '/customers' do
    customers = Customer.all

    content_type :json
    return customers.to_json
end

get '/users' do
    users = User.all

    content_type :json
    return users.to_json
end

get '/projects' do
    projects = Project.all

    content_type :json
    return projects.to_json
end

get '/tasks' do
    tasks = Task.all

    content_type :json
    return tasks.to_json
end

get '/task_entries' do
    task_entries = Task_entry.all

    content_type :json
    return task_entries.to_json
end
