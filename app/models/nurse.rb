class Nurse<ActiveRecord::Base
  has_many :patients
  def name
    self.first_name+" "+self.last_name
  end

  def slug
    self.first_name.downcase+"_"+self.last_name.downcase
  end

  def self.find_by_slug(slug)
    name=slug.split("_").map {|word| word.capitalize}
    #binding.pry
    patient=find_by(first_name: name[0], last_name: name[1])
    if patient
      return patient
    else
      return false
    end
  end
end
