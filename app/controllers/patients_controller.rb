class PatientsController<ApplicationController
 get '/add' do
   erb :'patients/new'
 end

 post '/add' do
   @patient=Patient.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name])
   @nurse=Nurse.find_by(id: current_user.id)
   if @nurse
     @nurse.patients<<@patient
     erb :'nurses/show'
   else
     erb :'nurses/new'
   end
 end

 get '/patients/:slug' do
   @patient=Patient.find_by_slug(params[:slug])
   erb :'patients/show'
 end

 get '/patients/:slug/edit' do

 end

 post '/patients/:slug/edit' do

 end

end
