class ApptypeRequest < ActiveRecord::Base
  
  validates_presence_of :appname
  
  before_create :check_exists
  
  def check_exists
    requestedapp = Apptype.where(:name.downcase => self.appname.downcase)
    if requestedapp.exists?
      return false
    end
  end
  
  def self.search(search)
    if search
      where('apprequestor ILIKE ? OR appname ILIKE ? OR completed ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
