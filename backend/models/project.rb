class Project
    include DataMapper::Resource
    property :id, Serial
    property :project_name, String
    belongs_to :customer, :child_key => [ :customer_id ]
    property :created_at, DateTime
    property :updated_at, DateTime
end