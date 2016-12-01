require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/crud.db")
require_relative 'models/user.rb'
DataMapper.finalize
User.auto_upgrade!

get '/' do
    "Hello World"
end
