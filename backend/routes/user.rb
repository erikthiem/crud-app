get '/users' do
    users = User.all

    content_type :json
    return users.to_json
end

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
