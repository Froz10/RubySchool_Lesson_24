#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


get '/login' do
	erb :login
end

post '/login' do

	@login = params[:login]
	@password = params[:password]
	@title = 'Ha ha, nice try!'
	@message = "Access denide"
	

	if @login == 'admin' && @password == 'secret'
		erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"

	elsif @login == 'admin' && @password == 'admin'
		erb :message

	else
		erb :message
	end

end


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end


get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username  = params[:username]
	@phone     = params[:phone]
	@datetime  = params[:datetime]
	@person    = params[:person]
	@color 	   = params[:color]	

	@title = 'Thank you!'
	@message = "Dear #{@username}, we'll be waiting for you at #{@datetime}"

	if @username == '' or @phone == '' or @datetime == '' or @person == '' or @color == ''
		@error = "Please, puts all lines"
		return erb :visit
	end

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Person: #{@person}, #{@color}\n"
	f.close

	erb :message

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@email             = params[:email]
	@emailmessage      = params[:emailmessage]


	@title2 = 'Thanks for your contact'
	@message2 = "Your message has been sent to #{@email}"

	f = File.open './public/contacts.txt', 'a'
	f.write "Email: #{@email}, Message: #{@emailmessage}\n"
	f.close

	erb :contacts_post

end