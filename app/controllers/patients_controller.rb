require 'rack-flash'

class PatientsController<ApplicationController
 use Rack::Flash



 get '/add' do
   erb :'patients/new'
 end

 post '/add' do
   #@patient=Patient.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name])
   @patient=Patient.find_or_create_by(params[:patient])
   @nurse=Nurse.find_by(id: current_user.id)
   if @nurse
     @nurse.patients<<@patient
     erb :'nurses/show'
   else
     erb :'nurses/new'
   end
 end

 get '/patients/:slug' do
   @nurse=Nurse.find_by(id: current_user.id)
   @patient=Patient.find_by_slug(params[:slug])
   if @nurse.patients.include?(@patient)
       erb :'patients/show'
     else
       #binding.pry
       flash[:message]="Patient #{@patient.name} is not in #{@nurse.name}'s schedule"
       erb :'nurses/show'
     end
 end

 get '/patients/:slug/edit' do
    @nurse=Nurse.find_by(id: current_user.id)
    @patient=Patient.find_by_slug(params[:slug])
    if @nurse.patients.include?(@patient)
        erb :'patients/edit'
      else
        flash[:message]="Patient #{@patient.name} is not in #{@nurse.name}'s schedule"
        erb :'nurses/show'
      end
 end

 get '/patients/:slug/delete' do
    @nurse=Nurse.find_by(id: current_user.id)
    @patient=Patient.find_by_slug(params[:slug])
    if @nurse.patients.include?(@patient)
      @nurse.patients.delete(@patient)
      @patient.delete
      flash[:message]="Successfully deleted patient #{@patient.name}"
    else
      flash[:message]="Patient #{@patient.name} is not in #{@nurse.name}'s schedule"
    end
    erb :'nurses/show'
 end

 post '/patients/:slug' do
    @patient=Patient.find_by_slug(params[:slug])
    if @patient
      @patient.update(params[:patient])
      #@patient.save
      flash[:message]="Successfully updated patient #{@patient.name}"
      erb :'/patients/show'

    else
      erb :'error'
    end
 end

 patch '/patients/:slug' do
    @patient=Patient.find_by_slug(params[:slug])
    if @patient
      @patient.update(params[:patient])
      #@patient.save
      flash[:message]="Successfully updated patient #{@patient.name}"
      erb :'/patients/show'

    else
      erb :'error'
    end
 end

end
