class Nmapfile < ActiveRecord::Base
  mount_uploader :nmapxml, NmapxmlUploader
  validates_presence_of :nmapfilename, :nmapxml
  
  def self.search(search)
    if search
      where('nmapfilename ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
