class Jumpsize < ActiveRecord::Base
  validates_presence_of :size, :length1, :length2, :itemsperpage
  validates_numericality_of   :length1, :only_integer => true, :greater_than => 0 
  validates_numericality_of   :length2, :only_integer => true, :greater_than => 0 
  validates_numericality_of   :itemsperpage, :only_integer => true, :greater_than => 0 
  
  def self.search(search)
    if search
      where('jumpsizecreator LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
