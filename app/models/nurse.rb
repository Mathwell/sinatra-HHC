class Nurse<ActiveRecord::Base
  has_many :patients
  def name
    self.first_name+" "+self.last_name
  end
end
