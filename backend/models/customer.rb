class Customer
    include DataMapper::Resource

    property :id, Serial

    property :company, String

    property :address1, String
    property :address2, String
    property :address3, String
    property :city, String
    property :state, String
    property :zip, String

    property :phone1, String
    property :phone2, String
    property :fax1, String
    property :fax2, String

    property :email, String
    property :website, String
    
    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :projects
end
