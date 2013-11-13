class Jumpsquare < ActiveRecord::Base
  has_many :apptypes
  #has_many :tags
   has_and_belongs_to_many  :tags
 # accepts_nested_attributes_for :apptypes
  
  def self.search(search)
    if search
      where('name ILIKE ? OR ipordns ILIKE ? OR url ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
       
end