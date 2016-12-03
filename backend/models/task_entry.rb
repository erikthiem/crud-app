class TaskEntry
    include DataMapper::Resource

    property :id, Serial

    property :duration, Integer
    property :note, String

    property :start_time, DateTime
    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :task
end
