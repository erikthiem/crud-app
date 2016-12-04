def get_item(item)

    if item then
        response.status = 200
        return item.to_json
    else
        response.status = 404
    end
end

def create_item(item)

    saveSuccessful = item.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end

def delete_item(item)
    if item then
        item.destroy
        response.status = 200
    else
        response.status = 404 
    end
end

require_relative "routes/user.rb"
require_relative "routes/customer.rb"
require_relative "routes/project.rb"
require_relative "routes/task.rb"
require_relative "routes/task_entry.rb"
