class NursesController<ApplicationController
 get '/new' do
   erb :'nurses/new'
 end

 get '/patients' do
   @nurse=Nurse.find_by(id: current_user.id)
   if @nurse
     erb :'nurses/show'
   else
     erb :'nurses/new'
   end
 end

 post '/new' do
   @nurse=Nurse.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name])
   erb:'nurses/show'
 end
end
