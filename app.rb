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

before do
	@barbers = Barber.all
end
get '/' do
	@barbers = Barber.all
	erb :index
end
get '/visit' do

	erb :visit
end

post '/visit' do
	# @username = params[:username]
	# @phone = params[:phone]
	# @visittime = params[:visittime]
	# @choice = params[:choice]
	# @color = params[:color]
	# c = Client.new
	# c.name = @username
	# c.phone = @phone
	# c.datestamp = @visittime
	# c.barber = @choice
	# c.color = @color
	# c.save
	c = Client.new params[:client]
	c.save
	erb "Вы записались!"
end