require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/crud.db")
require_relative 'models/user.rb'
require_relative 'models/customer.rb'
require_relative 'models/project.rb'
DataMapper.finalize
User.auto_upgrade!
Customer.auto_upgrade!
Project.auto_upgrade!

get '/' do
    "Hello World"
end
