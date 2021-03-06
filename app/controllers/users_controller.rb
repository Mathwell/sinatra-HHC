require 'rack-flash'
class UsersController<ApplicationController
  use Rack::Flash

  get '/' do
   erb :index
  end

  get '/login' do
    if logged_in?
      redirect to '/show'
    else
      erb :'users/login'
    end
  end

  get '/signup' do
  if logged_in?
    redirect to '/logout'
  else
    erb :'users/new'
  end
end

get '/show' do
  #binding.pry
  @user=current_user
  erb :'users/show'
end

post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @user=User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save
        session[:user_id]=@user.id
        flash[:message]="Complete your registration"
        erb :'/nurses/new'
      else
        flash[:message]=@user.errors.full_messages.join(" ")
        redirect to '/signup'
      end
    end


  end

 post '/login' do
   user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect "/show"
   else
       flash[:message]="User's credentials do not match our records. Try again or create a new account."
       redirect "/"
   end
 end

 get '/logout' do
   session.clear
   redirect '/'
 end
end
