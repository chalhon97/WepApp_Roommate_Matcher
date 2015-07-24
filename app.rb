require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:RoomMatch.sqlite3"

require './models'

set :sessions, true

get '/logout' do
	session.clear
	redirect '/'
end

get '/create_listing' do
	@user = current_user
	@listings = Listing.all
	erb :create_listing
end

get '/' do
	@user = current_user
	if @user
		redirect '/home'
	else
		erb :signin
	end
end

get '/profile' do
	@user = current_user
	@listings = Listing.all
	erb :profile
end
get '/about' do
	@user=current_user
	@listings = Listing.all
	erb :about
end
get '/contact' do
	@user=current_user
	@listings = Listing.all
	erb :contact
end

post '/logout' do
	session.clear
		redirect '/signin'
		erb :signin
	end
get '/preferences' do
	erb :preferences
end

get '/home' do
	@user = current_user
	@listings = Listing.all
	erb :home
end

post '/signin' do 
	@user=User.where(username: params[:username]).first
	if @user.password ==params[:password]
		session[:user_id]= @user.id
		redirect '/home'
	else
		redirect '/'
		puts "my params are" + params.inspect
	end
end


post '/signup' do
 puts params
 User.create(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], email: params[:email], password: params[:password], birthdate: params[:birthdate], sex: params[:sex], smoking: params[:smoking], pets: params[:pets], price: params[:price], city: params[:city], state: params[:state])
 redirect '/'
end


 
post '/create_listing' do
	puts params
	@user=current_user
	File.open('public/' + params[:myfile][:filename], "w") do |f|
	   f.write(params[:myfile][:tempfile].read)
	 end
	Listing.create(image_url: params[:myfile][:filename], caption: params[:caption], user_id: @user.id, borough: params[:borough], minage: params[:minage], maxage: params[:maxage], sex: params[:sex], smoking: params[:smoking], pets: params[:pets], minprice: params[:minprice], maxprice: params[:maxprice,])
  @pic = 'public/' + params[:myfile][:filename]
redirect '/home'
end



def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  end
end