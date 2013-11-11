class Apptype < ActiveRecord::Base
#attr_accessible :name, :image
  belongs_to :jumpsquares
  mount_uploader :image, ImageUploader
  validates_presence_of :name
    
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
