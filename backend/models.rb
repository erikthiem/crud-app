require 'data_mapper'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/crud.db")
require_relative 'models/user.rb'
require_relative 'models/customer.rb'
require_relative 'models/project.rb'
require_relative 'models/task.rb'
require_relative 'models/task_entry.rb'
require_relative 'models/session.rb'
DataMapper.finalize
DataMapper.auto_upgrade!
