class Tag < ActiveRecord::Base
   has_and_belongs_to_many :jumpsquares

  validates_presence_of :tagname

  def self.search(search)
    if search
      where('tagname ILIKE ? OR tagcreator ILIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
  
end
