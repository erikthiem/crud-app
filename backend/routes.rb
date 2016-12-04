require_relative "status_codes.rb"

def get_item(item)

    if item then
        response.status = STATUS_OK
        return item.to_json
    else
        response.status = STATUS_NOT_FOUND
    end
end


def create_item(item)

    saveSuccessful = item.save

    if saveSuccessful then
        response.status = STATUS_CREATED
    else
        response.status = STATUS_BAD_REQUEST
    end
end


def delete_item(item)

    if item then
        item.destroy
        response.status = STATUS_OK
    else
        response.status = STATUS_NOT_FOUND 
    end
end


def update_item(item, parameters)

    if item then
        updateSuccessful = item.update(parameters)

        if updateSuccessful then
            response.status = STATUS_OK
        else 
            response.status = STATUS_BAD_REQUEST
        end

    else
        response.status = STATUS_NOT_FOUND
    end
end


before do

    content_type :json

    response.headers["Access-Control-Allow-Origin"] = "*"
end


require_relative "routes/user.rb"
require_relative "routes/customer.rb"
require_relative "routes/project.rb"
require_relative "routes/task.rb"
require_relative "routes/task_entry.rb"
