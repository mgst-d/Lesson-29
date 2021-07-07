#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#set :database, "sqlite3:barber.db" не работает rake db:migrate
set :database, {adapter: "sqlite3", database: "barber.db"}
class Client < ActiveRecord::Base
end
class Barber < ActiveRecord::Base
end

get '/' do
	erb :index
end