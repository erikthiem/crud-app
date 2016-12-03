require 'bcrypt'

class User
    include DataMapper::Resource

    property :id, Serial

    property :username, String      , required: true, unique: true
    property :password, BCryptHash  , required: true
    property :email, String

    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :tasks
end
