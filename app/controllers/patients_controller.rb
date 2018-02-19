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
    @patient=Patient.find_by_slug(params[:slug])
    erb :'patients/edit'
 end

 get '/patients/:slug/delete' do
    @nurse=Nurse.find_by(id: current_user.id)
    @patient=Patient.find_by_slug(params[:slug])
    if @nurse.patients.include?(@patient)
      @nurse.patients.delete(@patient)
      @patient.delete
    end
    erb :'nurses/show'
 end

 post '/patients/:slug' do
    @patient=Patient.find_by_slug(params[:slug])
    if @patient
      @patient.first_name=params[:first_name]
      @patient.last_name=params[:last_name]
      @patient.ssn=params[:ssn]
      @patient.insurance=params[:insurance]
      @patient.save
      erb :'/patients/show'
    else
      erb :'nurses/show'
    end
 end

end
