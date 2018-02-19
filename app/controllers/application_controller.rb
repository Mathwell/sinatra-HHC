require_relative '../../config/environment'
require 'rack-flash'

class ApplicationController<Sinatra::Base
  configure do
     set :views, Proc.new { File.join(root, "../views/") }
     enable :sessions
    set :session_secret, "secret"
 end

 helpers do

    def logged_in?
      #binding.pry
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
