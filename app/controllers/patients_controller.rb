class PatientsController<ApplicationController
  get '/patients' do
    @nurse=Nurse.find_by(id: current_user.id)
    if @nurse
      erb :'patients/patients'
    else
      erb :'nurses/new'
    end
  end
end
