class Session
    include DataMapper::Resource

    property :id, Serial

    property :username, String      , required: true
    property :code, String          , required: true
end
