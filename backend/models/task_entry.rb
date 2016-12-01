class Task_entry
    include DataMapper::Resource
    property :id, Serial
    belongs_to :task, :child_key => [ :task_id ]
    property :duration, Integer
    property :note, String
    property :start_time, DateTime
    property :created_at, DateTime
    property :updated_at, DateTime
end
