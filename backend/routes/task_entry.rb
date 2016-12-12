require 'time_difference'

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

# Start a task entry
put '/task_entry/:id/start' do

    id = params[:id]

    task_entry = TaskEntry.first(:id => id)

    if task_entry then

        start_time = Time.now

        updated_parameters = {:start_time => start_time, :in_progress => true}
        update_item(task_entry, updated_parameters)
    else
        response.status = STATUS_BAD_REQUEST
    end
end

# Stop a task entry
put '/task_entry/:id/stop' do

    id = params[:id]

    task_entry = TaskEntry.first(:id => id)
    start_time = task_entry.start_time
    existing_duration = task_entry.duration

    if task_entry and start_time then

        stop_time = Time.now

        duration = TimeDifference.between(start_time, stop_time).in_seconds

        if existing_duration then
            duration = existing_duration + duration
        end

        updated_parameters = {:duration => duration, :in_progress => false}
        update_item(task_entry, updated_parameters)

    else
        response.status = STATUS_BAD_REQUEST
    end
        

end

# Set a task entry's duration manually
put '/task_entry/:id/set_duration' do
    id = params[:id]
    duration = params[:duration]

    puts "id: ", id
    puts "duration: ", duration
    
    task_entry = TaskEntry.first(:id => id)
    
    if task_entry then
        
        updated_parameters = {:duration => duration, :start_time => nil}
        update_item(task_entry, updated_parameters)
    else
        response.status = STATUS_BAD_REQUEST
    end  
end

def to_csv(model, records)
    CSV.generate do |csv|
        records.each do |record|
            csv << record.attributes.values
        end
    end
end

def csvTaskEntries()

    user = getCurrentUser()

    tasks = Task.all(:user_id => user.id)

    task_entries = []

    tasks.each do |task|

        task.task_entries.each do |task_entry|
            task_entries << task_entry
        end
    end

    data = to_csv(TaskEntry, task_entries)

    return data
end

# Export task entries
get '/task_entries/export' do
    data = csvTaskEntries()

    content_type "application/csv"

    return data
end
