class Task
    include DataMapper::Resource
    property :id, Serial

    property :task_name, String

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :project, :child_key => [ :project_id ]
    belongs_to :user, :child_key => [ :user_id ]

    has n, :task_entries
end
