class Customer
    include DataMapper::Resource

    property :id, Serial

    property :company, String
    property :address, String
    property :city, String
    property :state, String
    property :zip, String

    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :projects
end
