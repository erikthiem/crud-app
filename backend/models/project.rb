class Project
    include DataMapper::Resource

    property :id, Serial

    property :project_name, String

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :customer

    has n, :tasks
end
