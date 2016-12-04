get '/tasks' do
    tasks = Task.all

    content_type :json
    return tasks.to_json
end

post '/tasks' do
    task_name = params[:task_name]
    project_id = params[:project_id]
    user_id = params[:user_id]

    task = Task.create(:task_name => task_name, :project_id => project_id, :user_id => user_id)

    saveSuccessful = task.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end
