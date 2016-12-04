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
