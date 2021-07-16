#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#set :database, "sqlite3:barber.db" не работает rake db:migrate
set :database, {adapter: "sqlite3", database: "barber.db"}
class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
	validates :color, presence: true
end
class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end
get '/' do

	erb :index
end
get '/visit' do
	@c = Client.new
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
	#@c = Client.new params[:client]
	@c = Client.new params[:client]
	if @c.save
		erb "Вы записались!"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end