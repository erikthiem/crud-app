require_relative "../controllers/authentication.rb"

# Get all users
get '/users' do

    users = User.all
    return users.to_json
end


# Get a specific user
get '/user/:id' do

    id = params[:id]

    user = User.get(id)
    get_item(user)
end


# Create a new user
post '/users' do

    username = params[:username]
    password = params[:password]
    email = params[:email]

    user = User.create(:username => username, :password => password, :email => email) 
    create_item(user)
end


# Modify a user
put '/user/:id' do

    id = params[:id]
    username = params[:username]
    password = params[:password]
    email = params[:email]

    updated_parameters = {:username => username, :password => password, :email => email}

    user = User.get(id)
    update_item(user, updated_parameters)
end


# Delete a user
delete '/user/:id' do

    id = params[:id]

    user = User.get(id)
    delete_item(user)
end

# Login
post '/user/login' do

    username = params[:username]
    password = params[:password]

    if (validUser(username, password)) then

        code = generateSessionCode()

        session = Session.create(:username => username, :code => code) 
        create_item(session)

        response.status = 200

        codeObject = {'code': code}

        return codeObject.to_json
    else
        response.status = 401
    end
end

# Logout
post '/user/logout' do

    puts params
    
    session_code = params[:session_code]

    session = Session.first(:code => session_code)

    if session then

        session.destroy
        response.status = 200

        return "".to_json
    
    else
        response.status = 400
    end
end
