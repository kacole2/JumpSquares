class Jumpsquare < ActiveRecord::Base
   has_many :apptypes
  #has_many :tags
   has_and_belongs_to_many  :tags
 # accepts_nested_attributes_for :apptypes
   resourcify
   
  def self.search(search)
    if search
      where('name LIKE ? OR ipordns LIKE ? OR url LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
       
end