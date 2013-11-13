class Tag < ActiveRecord::Base
   has_and_belongs_to_many :jumpsquares
  #default_scope :order => 'tags.tagname ASC'
  default_scope order: 'lower(tagname)'
  validates_presence_of :tagname

  def self.search(search)
    if search
      where('tagname ILIKE ? OR tagcreator ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
end
