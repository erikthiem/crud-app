class User
    include DataMapper::Resource
    property :id, Serial
    property :username, String
    property :password, String
    property :email, String
    property :created_at, DateTime
    property :updated_at, DateTime
end
