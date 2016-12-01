class Task
    include DataMapper::Resource
    property :id, Serial
    belongs_to :project, :child_key => [ :project_id ]
    belongs_to :user, :child_key => [ :user_id ]
    property :task_name, String
    property :created_at, DateTime
    property :updated_at, DateTime
end
