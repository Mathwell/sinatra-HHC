class UsersController<ApplicationController

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
    redirect to '/show'
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
      @user.save
      session[:user_id]=@user.id
      redirect to '/show'
    end


  end

 post '/login' do
   user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect "/show"
   else
       redirect "/signup"
   end
 end

 get '/logout' do
   session.clear
   redirect '/'
 end
end
