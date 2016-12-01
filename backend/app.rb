require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/crud.db")
require_relative 'models/user.rb'
require_relative 'models/customer.rb'
require_relative 'models/project.rb'
require_relative 'models/task.rb'
require_relative 'models/task_entry.rb'
DataMapper.finalize
User.auto_upgrade!
Customer.auto_upgrade!
Project.auto_upgrade!
Task.auto_upgrade!
Task_entry.auto_upgrade!

get '/' do
    "Hello World"
end
