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
        return item.to_json
    else
        response.status = STATUS_BAD_REQUEST
    end
end


def delete_item(item)

    if item then
        item.destroy
        response.status = STATUS_OK
        return "".to_json
    else
        response.status = STATUS_NOT_FOUND 
    end
end


def update_item(item, parameters)

    if item then
        updateSuccessful = item.update(parameters)

        if updateSuccessful then
            response.status = STATUS_OK
            return "".to_json
        else 
            response.status = STATUS_BAD_REQUEST
        end

    else
        response.status = STATUS_NOT_FOUND
    end
end

def authenticated_user(session_code)
    session = Session.first(:code => session_code)
    
    if session then
        return true
    else
        return false
    end
end


before do

    content_type :json
    response.headers["Access-Control-Allow-Origin"] = "*"

    pass if request.path_info == "/user/login"

    session_code = params[:session_code]

    puts session_code

    a = authenticated_user(session_code)
    puts a

    if not authenticated_user(session_code) then
        puts "This is hit"
        response.status = STATUS_UNAUTHORIZED
        halt 401
    end

end


require_relative "routes/user.rb"
require_relative "routes/customer.rb"
require_relative "routes/project.rb"
require_relative "routes/task.rb"
require_relative "routes/task_entry.rb"
