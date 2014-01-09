class Apptype < ActiveRecord::Base
#attr_accessible :name, :image
  belongs_to :jumpsquares
  mount_uploader :image, ImageUploader
  resourcify
  validates_presence_of :name
    
  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end
  
end
