# Get all users
get '/users' do
    users = User.all

    content_type :json
    return users.to_json
end

# Get a specific user
get '/user/:id' do
    id = params[:id]

    user = User.get(id)

    content_type :json

    if user then
        response.status = 200
        return user.to_json
    else
        response.status = 404
    end
end

# Create a new user
post '/users' do
    username = params[:username]
    password = params[:password]
    email = params[:email]

    user = User.create(:username => username, :password => password, :email => email) 

    saveSuccessful = user.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end

# Modify a user
put '/user/:id' do
    id = params[:id]
    username = params[:username]
    password = params[:password]
    email = params[:email]

    user = User.get(id)

    if user then
        updateSucessful = user.update(:username => username, :password => password, :email => email)

        if updateSucessful then
            response.status = 200
        else
            response.status = 400
        end

    else
        response.status = 404
    end
end

# Delete a user
delete '/user/:id' do
    id = params[:id]

    user = User.get(id)

    if user then
        user.destroy
        response.status = 200
    else
        response.status = 404 
    end
end
