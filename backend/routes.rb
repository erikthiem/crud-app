require_relative "status_codes.rb"

set :public_folder, File.dirname(__FILE__) + '/../frontend/'

get '/' do
    content_type "text/html"
    send_file File.expand_path('index.html', '../frontend/')
end

get '/admin' do
    content_type "text/html"
    send_file File.expand_path('admin.html', '../frontend/')
end

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

def getCurrentUser()
    session_code = session["code"]
    current_session = Session.first(:code => session_code)

    user = User.first(:username => current_session.username)

    return user
end


before do

    response.headers["Access-Control-Allow-Origin"] = "*"

    if request.request_method != "OPTIONS"

        pass if request.path_info == "/user/login" || request.path_info == "/" || request.path_info =="/users/post" || request.path_info == "/isloggedin"

        content_type :json

        session_code = session["code"]

        if not authenticated_user(session_code) then
            response.status = STATUS_UNAUTHORIZED
            halt 401
        end

    end

end


require_relative "routes/user.rb"
require_relative "routes/customer.rb"
require_relative "routes/project.rb"
require_relative "routes/task.rb"
require_relative "routes/task_entry.rb"
