class Task
    include DataMapper::Resource

    property :id, Serial

    property :task_name, String

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :project
    belongs_to :user

    has n, :task_entries
end
